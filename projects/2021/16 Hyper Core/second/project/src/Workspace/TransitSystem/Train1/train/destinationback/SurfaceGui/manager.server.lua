local line = script.Parent.Parent.Parent.Parent.linenumber.Value

if line == 0 then
	script.Parent.title.Visible = false
	script.Parent.number.Text = "LINE CLOSED"
	script.Parent.number.Font = Enum.Font.GothamBlack
else
	script.Parent.title.Visible = true
	script.Parent.number.Text = line
	script.Parent.number.Font = Enum.Font.Oswald
end

script.Parent.Parent.Parent.Parent.linenumber.Changed:Connect(function()
	local line = script.Parent.Parent.Parent.Parent.linenumber.Value
	
	if line == 0 then
		script.Parent.title.Visible = false
		script.Parent.number.Text = "LINE CLOSED"
		script.Parent.number.Font = Enum.Font.GothamBlack
	else
		script.Parent.title.Visible = true
		script.Parent.number.Text = line
		script.Parent.number.Font = Enum.Font.Oswald
	end
end)