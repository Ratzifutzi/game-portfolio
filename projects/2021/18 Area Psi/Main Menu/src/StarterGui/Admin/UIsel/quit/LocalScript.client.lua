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
	for i = 0,50 do
		wait(.01)
		script.Parent.Parent.Parent.Fullscreen.BackgroundTransparency = 1 - i / 50
	end
	script.Parent.Parent.Parent.Enabled = false
	script.Parent.Parent.Parent.Parent.ScreenGui.Enabled = true
	script.Parent.Parent.Parent.Parent.ScreenGui.Fullscreen.BackgroundTransparency = 0
	for i = 0,50 do
		wait(.01)
 		script.Parent.Parent.Parent.Parent.ScreenGui.Fullscreen.BackgroundTransparency = i / 50
		workspace.Music.Volume = i / 50
	end
	script.Parent.Parent.curUI.Value = "home"
end)

script.Parent.Parent.Parent.Fullscreen.BackgroundTransparency = 0