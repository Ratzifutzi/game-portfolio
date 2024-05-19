if script.Parent.Parent.curTab.Value == script.Parent.Name then
	script.Parent.Font = Enum.Font.GothamBlack
else
	script.Parent.Font = Enum.Font.GothamSemibold
end

script.Parent.MouseButton1Click:Connect(function()
	script.Parent.Parent.curTab.Value = script.Parent.Name
end)

script.Parent.Parent.curTab.Changed:Connect(function()
	if script.Parent.Parent.curTab.Value == script.Parent.Name then
		script.Parent.Font = Enum.Font.GothamBlack
	else
		script.Parent.Font = Enum.Font.GothamSemibold
	end
end)