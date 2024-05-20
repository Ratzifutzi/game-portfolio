local TextFunctions = {}

function TextFunctions:GetAdditions(StartingText, Start, End)
	local StartAddition = 0
	local EndAddition = 0

	local TempText = StartingText:sub(Start, End)
	while TempText:match('<[^<>]->')do
		local Tag = TempText:match('<[^<>]->')
		local IsEnd = Tag:find('/')

		if IsEnd then
			EndAddition += #Tag
		else
			StartAddition += #Tag
		end

		TempText = TempText:gsub('<[^<>]->', '', 1)
	end
	
	return StartAddition, EndAddition
end

function TextFunctions:GetMarkups(Textbox, Selection)
	local Markups = {}
	local StartMarkups = {}
	local EndMarkups = {}
	local Index = 0
	local StartingText = Textbox.Text
	local Text = StartingText

	while Text:find('<[^<>]->') do
		local Start, End = Text:find('<[^<>]->')
		local Markup = Text:sub(Start, End)

		table.insert((Markup:sub(2, 2) == '/' and EndMarkups) or StartMarkups, { -- Markups
			Markup = Markup,
			Start = Start + Index,
			End = End + Index
		})

		Text = Text:sub(1, Start) .. Text:sub(End + 1, #Text)
		Index += End - Start
	end

	for i, Markup in pairs(Markups)do
		table.insert((Markup.Markup:sub(2, 2) == '/' and EndMarkups) or StartMarkups, Markup)
	end

	table.sort(EndMarkups, function(a, b) return a.Start < b.Start end)
	table.sort(StartMarkups, function(a, b) return a.Start > b.Start end)

	Markups = {}

	for i, Markup in pairs(StartMarkups)do
		local target = Markup.Markup:match('[^<>]+'):sub(1, (Markup.Markup:find(' ') or (#Markup.Markup + 1)) - 1):gsub('%A+', '')

		for i, EndMarkup in pairs(EndMarkups)do
			local MarkupName = EndMarkup.Markup:match('[^<>]+'):sub(2, (EndMarkup.Markup:find(' ') or (#EndMarkup.Markup + 1)) - 1):gsub('%A+', '')
			local StartAddition, EndAddition = self:GetAdditions(StartingText, Markup.End + 1, EndMarkup.Start - 1)
			local SelectionStartAddition, SelectionEndAddition = self:GetAdditions(StartingText, Selection.Start, Selection.End)
			
			local SameAsSelection = ((Markup.End + 1) == Selection.Start and EndMarkup.Start == Selection.End)
			local SimilarSelection = ((Markup.End + 1 + StartAddition) == (Selection.Start + SelectionStartAddition) and (EndMarkup.Start - EndAddition) == (Selection.End + SelectionEndAddition))
			
			if MarkupName == target and (SameAsSelection or SimilarSelection) then -- ((Markup.End + 1 + StartAddition) == Selection.Start and (EndMarkup.Start - EndAddition) == Selection.End)
				
				--if not (string.match('^' .. Selection.Text .. '$', StartingText:sub(Markup.End + 1, EndMarkup.Start - 1):gsub('<[^<>]->', ''))) then continue end --  and (markup.End + 1) == Selection.Start and endMarkup.Start == Selection.End
				
				table.insert(Markups, {
					Markup = target,
					Text = StartingText:sub(Markup.End + 1, EndMarkup.Start - 1),
					Start = Markup,
					End = EndMarkup
				})

				break
			end
		end
	end

	return Markups
end

function TextFunctions:MakeNumberOnly(Textbox, Min, Max)
	Textbox:GetPropertyChangedSignal('Text'):Connect(function()
		local text = Textbox.Text:gsub('%D%.+', '')
		Textbox.Text = #text > 0 and text or ''
	end)
	
	Textbox.FocusLost:Connect(function()
		Textbox.Text = #Textbox.Text > 0 and tostring(math.clamp(tonumber(Textbox.Text), Min or -math.huge, Max or math.huge))
	end)
end

function TextFunctions:GetSelectedText(Textbox)
	local SelectionStart = Textbox:GetAttribute('SelectionStart')
	local SelectionEnd = Textbox:GetAttribute('CursorPosition')
	
	if not (SelectionStart and SelectionEnd) then return end
	
	if not (Textbox and SelectionStart ~= -1 or SelectionEnd ~= -1) then return end
	
	if SelectionStart > SelectionEnd then
		local Temp = SelectionStart
		SelectionStart = SelectionEnd
		SelectionEnd = Temp
	end
	
	local Text = Textbox.Text
	local SelectedText = Text:sub(SelectionStart, SelectionEnd - 1)
	
	return {
		Text = SelectedText,
		Start = SelectionStart,
		End = SelectionEnd
	}
end

function TextFunctions:TrackProperties(Textbox, Properties)
	for i, property in pairs(Properties)do
		Textbox:GetPropertyChangedSignal(property):Connect(function()
			if not (Textbox:IsFocused() and Textbox[property] ~= -1) then return end
			
			Textbox:SetAttribute(property, Textbox[property])
		end)
	end
end

function TextFunctions:RecaptureFocus(Textbox, Start, End)
	Textbox:CaptureFocus()
	
	Textbox.SelectionStart = Start
	Textbox.CursorPosition = End
end

function TextFunctions:HasMarkup(Identifier, Markups)
	for i, Markup in pairs(Markups)do
		if Markup.Markup == Identifier then
			return Markup
		end
	end
end

function TextFunctions:ApplyFontSize(Input, Size)
	local Selection = self:GetSelectedText(Input)
	local Markups = self:GetMarkups(Input, Selection)

	local Font = self:HasMarkup('font', Markups)
	if Font then
		local Output = ''
		local Inputs = {}
		local Parameters = Font.Start.Markup:split(' ')
		local Text = Input.Text
		table.remove(Parameters, 1)

		for i, Parameter in pairs(Parameters)do
			local Split = Parameter:gsub('[">]+', ''):split('=')

			if Split[1]:lower() == 'size' then continue end

			Output ..= string.format(' %s="%s"', Split[1], Split[2])
		end

		Output ..= string.format(' size="%s"', Size)

		local Begging = string.format('<font%s>', Output)
		local Difference = #Begging - #Font.Start.Markup
		Input.Text = string.format(Text:sub(1, Font.Start.Start - 1) .. Begging .. '%s</font>' .. Text:sub(Font.End.End + 1, #Text), Font.Text)

		task.wait()
		self:RecaptureFocus(Input, Selection.Start + Difference, Selection.End + Difference)
	else
		local Text = Input.Text
		local Begging = string.format('<font size="%s">', Size)
		Input.Text = string.format(Text:sub(1, Selection.Start - 1) .. Begging .. '%s</font>' .. Text:sub(Selection.End, #Text), Selection.Text)

		task.wait()
		self:RecaptureFocus(Input, Selection.Start + #Begging, Selection.End + #Begging)
	end
end

function TextFunctions:ApplyFont(Input, Name)
	local Selection = self:GetSelectedText(Input)
	local Markups = self:GetMarkups(Input, Selection)

	local Font = self:HasMarkup('font', Markups)
	if Font then
		local Output = ''
		local Inputs = {}
		local Parameters = Font.Start.Markup:split(' ')
		local Text = Input.Text
		table.remove(Parameters, 1)
		
		for i, Parameter in pairs(Parameters)do
			local Split = Parameter:gsub('[">]+', ''):split('=')
			
			if Split[1]:lower() == 'face' then continue end
			
			Output ..= string.format(' %s="%s"', Split[1], Split[2])
		end
		
		Output ..= string.format(' face="%s"', Name)

		local Begging = string.format('<font%s>', Output)
		local Difference = #Begging - #Font.Start.Markup
		Input.Text = string.format(Text:sub(1, Font.Start.Start - 1) .. Begging .. '%s</font>' .. Text:sub(Font.End.End + 1, #Text), Font.Text)

		task.wait()
		self:RecaptureFocus(Input, Selection.Start + Difference, Selection.End + Difference)
	else
		local Text = Input.Text
		local Begging = string.format('<font face="%s">', Name)
		Input.Text = string.format(Text:sub(1, Selection.Start - 1) .. Begging .. '%s</font>' .. Text:sub(Selection.End, #Text), Selection.Text)

		task.wait()
		self:RecaptureFocus(Input, Selection.Start + #Begging, Selection.End + #Begging)
	end
end

function TextFunctions:ApplyColour(Input, Colour)
	local Selection = self:GetSelectedText(Input)
	local Markups = self:GetMarkups(Input, Selection)

	local Font = self:HasMarkup('font', Markups)
	if Font then
		local Output = ''
		local Inputs = {}
		local Parameters = Font.Start.Markup:split(' ')
		local Text = Input.Text
		table.remove(Parameters, 1)

		for i, Parameter in pairs(Parameters)do
			local Split = Parameter:gsub('[">]+', ''):split('=')

			if Split[1]:lower() == 'color' then continue end

			Output ..= string.format(' %s="%s"', Split[1], Split[2])
		end

		Output ..= string.format(' color="rgb(%s)"', Colour)

		local Begging = string.format('<font%s>', Output)
		local Difference = #Begging - #Font.Start.Markup
		Input.Text = string.format(Text:sub(1, Font.Start.Start - 1) .. Begging .. '%s</font>' .. Text:sub(Font.End.End + 1, #Text), Font.Text)

		--task.wait()
		self:RecaptureFocus(Input, Selection.Start + Difference, Selection.End + Difference)
	else
		local Text = Input.Text
		local Begging = string.format('<font color="rgb(%s)">', Colour)
		Input.Text = string.format(Text:sub(1, Selection.Start - 1) .. Begging .. '%s</font>' .. Text:sub(Selection.End, #Text), Selection.Text)

		--task.wait()
		self:RecaptureFocus(Input, Selection.Start + #Begging, Selection.End + #Begging)
	end
end

function TextFunctions:ApplyStroke(Input, Extra)
	local Selection = self:GetSelectedText(Input)
	local Markups = self:GetMarkups(Input, Selection)
	local Text = Input.Text

	local Text = Input.Text
	local Begging = string.format('<stroke %s>', Extra)
	local Stroke = self:HasMarkup('stroke', Markups)
	if Stroke then
		local Addition = (Stroke.Start.End - Stroke.Start.Start)
		Text = Text:sub(1, Stroke.Start.Start - 1) .. Text:sub(Stroke.Start.End + 1, Stroke.End.Start - 1) .. Text:sub(Stroke.End.End + 1, #Text)
		
		Input.Text = string.format(Text:sub(1, Selection.Start - 2 - Addition) .. Begging .. '%s</stroke>' .. Text:sub(Selection.End - Addition, #Text), Selection.Text)
		self:RecaptureFocus(Input, Selection.Start - Addition - 1 + #Begging, Selection.End - Addition - 1 + #Begging)
	else
		Input.Text = string.format(Text:sub(1, Selection.Start - 1) .. Begging .. '%s</stroke>' .. Text:sub(Selection.End, #Text), Selection.Text)
		self:RecaptureFocus(Input, Selection.Start + #Begging, Selection.End + #Begging)
	end
end

function TextFunctions:ApplyMarkup(Input, Identifier, Extra)
	local Selection = self:GetSelectedText(Input)
	local Markups = self:GetMarkups(Input, Selection)

	local Tag = self:HasMarkup(Identifier, Markups)
	local Addition = #Identifier + 2
	if Tag then
		local Text = Input.Text
		Input.Text = Text:sub(1, Tag.Start.Start - 1) .. Text:sub(Tag.Start.End + 1, Tag.End.Start - 1) .. Text:sub(Tag.End.End + 1, #Text)

		self:RecaptureFocus(Input, Selection.Start - Addition, Selection.End - Addition)
	else
		local Text = Input.Text
		Input.Text = string.format(Text:sub(1, Selection.Start - 1) .. '<%s>%s</%s>' .. Text:sub(Selection.End, #Text), Identifier .. ((Extra and ' ' .. Extra) or ''), Selection.Text, Identifier)

		self:RecaptureFocus(Input, Selection.Start + Addition, Selection.End + Addition)
	end
end

function TextFunctions:ClearFormatting(Input)
	local Selection = self:GetSelectedText(Input)
	local Text = Selection.Text
	local StartAddition, EndAddition = TextFunctions:GetAdditions(Text, Selection.Start, Selection.End)
	
	Text = Text:gsub('<[^<>]->', '')
	Input.Text = string.format(Input.Text:sub(1, Selection.Start - 1) .. '%s' .. Input.Text:sub(Selection.End, #Input.Text), Text)
	
	self:RecaptureFocus(Input, Selection.Start - StartAddition, Selection.End - (#Selection.Text - #Text))
end

return TextFunctions