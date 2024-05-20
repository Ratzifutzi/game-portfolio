--[[
	Scripted by LumberUniverse
]]

local TextService = game:GetService('TextService')

local Main = {}

function Main:Init(Menu, UI, Resources)
	self.UI = UI
	self.Menu = Menu
	self.Buttons = UI.Buttons
	self.Output = UI.Output.Content
	self.Resources = Resources
	self.TextFunctions = require(Resources.Modules.TextFunctions)
	self.InputScroll = self.UI.Input:FindFirstChildOfClass('ScrollingFrame')
	self.Input = self.InputScroll:FindFirstChildOfClass('TextBox')
	self.Size = self.Buttons.Font.TextSize:FindFirstChildOfClass('TextBox')
	self.Fonts = Enum.Font:GetEnumItems()
	
	table.sort(self.Fonts, function(a, b) return a.Name < b.Name end)
	
	self.TextFunctions:TrackProperties(self.Input, {'CursorPosition', 'SelectionStart'})
	self.TextFunctions:MakeNumberOnly(self.Size, 0, 100)
	
	self.Buttons.Bold.MouseButton1Click:Connect(function()
		self.TextFunctions:ApplyMarkup(self.Input, 'b')
	end)

	self.Buttons.Italics.MouseButton1Click:Connect(function()
		self.TextFunctions:ApplyMarkup(self.Input, 'i')
	end)

	self.Buttons.Underline.MouseButton1Click:Connect(function()
		self.TextFunctions:ApplyMarkup(self.Input, 'u')
	end)

	self.Buttons.Strikethrough.MouseButton1Click:Connect(function()
		self.TextFunctions:ApplyMarkup(self.Input, 's')
	end)

	self.Buttons.Uppercase.MouseButton1Click:Connect(function()
		self.TextFunctions:ApplyMarkup(self.Input, 'uc')
	end)

	self.Buttons.Smallcaps.MouseButton1Click:Connect(function()
		self.TextFunctions:ApplyMarkup(self.Input, 'sc')
	end)

	self.Buttons.Clear.MouseButton1Click:Connect(function()
		self.TextFunctions:ClearFormatting(self.Input)
	end)

	self.Buttons.Font.Toggle.MouseButton1Click:Connect(function()
		self.Buttons.Font.Menu.Visible = not self.Buttons.Font.Menu.Visible
		self.Buttons.Font.Toggle.TextLabel.Rotation = (self.Buttons.Font.Menu.Visible and 0) or 180
	end)

	self.Buttons.Colour.MouseButton1Click:Connect(function()
		if not self.UIs then return end
		
		local Position = self.Menu:GetRelativeMousePosition()
		local Size = self.UIs.ColourMenu.UI.AbsoluteSize
		local MenuSize = self.UI.AbsoluteSize
		
		self.UIs.ColourMenu.UI.Visible = true
		self.UIs.ColourMenu.UI.Position = UDim2.new(0, Position.X, 0, 34)

		if Position.X + Size.X > MenuSize.X or Position.Y + Size.Y > MenuSize.Y then
			self.UIs.ColourMenu.UI.AnchorPoint = Vector2.new(1, 0)
		else
			self.UIs.ColourMenu.UI.AnchorPoint = Vector2.new(0, 0)
		end

		self.UIs.ColourMenu.Module:Open('Main')
	end)

	self.Buttons.Stroke.MouseButton1Click:Connect(function()
		if not self.UIs then return end

		local Position = self.Menu:GetRelativeMousePosition()
		local Size = self.UIs.Stroke.UI.AbsoluteSize
		local MenuSize = self.UI.AbsoluteSize

		self.UIs.Stroke.UI.Visible = true
		self.UIs.Stroke.UI.Position = UDim2.new(0, Position.X, 0, 34)

		if Position.X + Size.X > MenuSize.X or Position.Y + Size.Y > MenuSize.Y then
			self.UIs.Stroke.UI.AnchorPoint = Vector2.new(1, 0)
		else
			self.UIs.Stroke.UI.AnchorPoint = Vector2.new(0, 0)
		end
	end)
	
	self.Size.FocusLost:Connect(function()
		local Selection = self.TextFunctions:GetSelectedText(self.Input)
		local Markups = self.TextFunctions:GetMarkups(self.Input, Selection)
		
		if #self.Size.Text <= 0 then self.Size.Text = '14' end
		
		self.TextFunctions:ApplyFontSize(self.Input, self.Size.Text)
	end)
	
	self.Input:GetPropertyChangedSignal('Text'):Connect(function()
		self.Output.Text = self.Input.Text
		
		local AbsoluteSize = self.InputScroll.AbsoluteSize
		local Size = TextService:GetTextSize(self.Input.Text, self.Input.TextSize, self.Input.Font, Vector2.new(AbsoluteSize.X - 8, math.huge))
		self.Input.Size = UDim2.new(0, AbsoluteSize.X - 8, 0, math.clamp(Size.Y, AbsoluteSize.Y, math.huge))
	end)
	
	self.Output.Text = self.Input.Text
	
	task.spawn(function()
		for i, Font in pairs(self.Fonts)do
			local button = Instance.new('TextButton')
			button.Name = Font.Name
			button.Parent = self.Buttons.Font.Menu.ScrollingFrame
			button.BackgroundTransparency = 1
			button.Size = UDim2.new(1, 0, 0, 24)
			button.Font = Font
			button.TextSize = 16
			button.Text = Font.Name
			button.TextColor3 = Color3.fromRGB(188, 188, 188)
			button.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
			button.TextStrokeTransparency = 0.9
			button.ZIndex = 999
			
			button.MouseButton1Click:Connect(function()
				self.TextFunctions:ApplyFont(self.Input, Font.Name)
				
				self.Buttons.Font.Menu.Visible = false
				self.Buttons.Font.Toggle.TextLabel.Rotation = (self.Buttons.Font.Menu.Visible and 0) or 180
			end)
		end
	end)
end

function Main:SetUIs(UIs)
	self.UIs = UIs
end

return Main