if script.Parent.Parent.curUI.Value == script.Parent.Name then
	script.Parent.Font = Enum.Font.SourceSans
else
	script.Parent.Font = Enum.Font.SourceSansLight
end

script.Parent.Parent.curUI.Changed:Connect(function()
	if script.Parent.Parent.curUI.Value == script.Parent.Name then
		script.Parent.Font = Enum.Font.SourceSans
	else
		script.Parent.Font = Enum.Font.SourceSansLight
	end
end)

script.Parent.MouseButton1Click:Connect(function()
	script.Parent.Parent.curUI.Value = script.Parent.Name
end)