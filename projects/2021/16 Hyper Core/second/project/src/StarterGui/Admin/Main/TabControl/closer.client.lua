script.Parent.curTab.Changed:Connect(function()
	if script.Parent.curTab.Value == "Quit" then
		script.Parent.Parent.Black.Visible = true
		for i = 0,40 do
			script.Parent.Parent.Black.BackgroundTransparency = 1 - i / 40
			wait(.01)
		end
		script.Parent.curTab.Value = "Welcome"
		script.Parent.Visible = false
		script.Parent.Parent.Decoration.Visible = false
		script.Parent.Parent.Black.Visible = false
		script.Parent.Parent.Tabs.Visible = false
		script.Parent.Parent.Parent.Login.Visible = false
		wait(.2)
		for i = 0,50 do
			script.Parent.Parent.BackgroundTransparency = i / 50
			wait(.01)
		end
		game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
	end
end)