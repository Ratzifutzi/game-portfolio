DataStoreService = game:GetService("DataStoreService")


game.Players.PlayerAdded:Connect(function(plr)
	local SettingsFolder = Instance.new("Folder")
	SettingsFolder.Name = "UserSettings"
	SettingsFolder.Parent = plr
	
	local GraphicsLevel = Instance.new("IntValue")
	GraphicsLevel.Value = 0
	GraphicsLevel.Name = "GraphicsLevel"
	GraphicsLevel.Parent = SettingsFolder
	
	
end)