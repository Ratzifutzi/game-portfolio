script.Parent.Changed:Connect(function()
	if not tonumber(script.Parent.Text) then
		script.Parent.TextColor3 = Color3.new(0.513725, 0, 0)
	else
		script.Parent.TextColor3 = Color3.new(0.109804, 0.545098, 0.0862745)
	end
end)