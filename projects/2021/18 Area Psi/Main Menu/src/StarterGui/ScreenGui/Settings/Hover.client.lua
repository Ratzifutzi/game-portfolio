script.Parent.MouseEnter:Connect(function()
	if script.Parent.TextTransparency < 1 and script.Parent.Visible == true then
		script.hover:Play()
	end
end)