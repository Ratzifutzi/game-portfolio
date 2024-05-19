script.Parent.MouseButton1Click:Connect(function()
	if script.Parent.Parent.Settings.TextTransparency == 0 then
		if script.Parent.Parent.SettingsUI.Visible == false then
			script.Parent.Parent.LobbyCreation.Visible = false
			script.Parent.Parent.SettingsUI.Visible = false
			script.Parent.Parent.SettingsUI.Visible = true
		else
			script.Parent.Parent.LobbyCreation.Visible = false
			script.Parent.Parent.SettingsUI.Visible = false
		end
	end
end)