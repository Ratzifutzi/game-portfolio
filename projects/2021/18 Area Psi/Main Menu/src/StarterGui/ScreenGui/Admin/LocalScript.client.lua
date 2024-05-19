script.Parent.MouseButton1Click:Connect(function()
	if script.Parent.Parent.Settings.TextTransparency == 0 then
		for i = 0,50 do
			wait(.01)
			script.Parent.Parent.Fullscreen.BackgroundTransparency = 1 - i / 50
			workspace.Music.Volume = 1 - i / 50
		end
		script.Parent.Parent.Enabled = false
		script.Parent.Parent.Parent.Admin.Enabled = true
		for i = 0,50 do
			wait(.01)
			script.Parent.Parent.Parent.Admin.Fullscreen.BackgroundTransparency =  i / 50
		end
	end
end)