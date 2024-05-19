local DataStoreService = game:GetService("DataStoreService")
local DataStore = DataStoreService:GetDataStore("PlayerData")

game.Players.PlayerAdded:Connect(function(player)
	local playerfolder = Instance.new("Folder")
	playerfolder.Parent = player
	playerfolder.Name = "PlayerData"
	
	
	local Level = Instance.new("IntValue")
	Level.Parent = playerfolder
	Level.Name = "level"
	
	local XP = Instance.new("IntValue")
	XP.Parent = playerfolder
	XP.Name = "xp"
	
	local maxXP = Instance.new("IntValue")
	XP.Parent = playerfolder
	XP.Name = "maxxp"
	
	
	Level.Value = 0
	if Level.Value == 0 or Level.Value == nil then
		Level.Value = 1
	end
	
	XP.Value = 0
	
	while true do
		wait(30)
		local success, err = pcall(function()
			DataStore:SetAsync(player.UserId.."-level", Level.Value)
			DataStore:SetAsync(player.UserId.."-xp", XP.Value)
		end)

		if success then
		end
	end
	
end)