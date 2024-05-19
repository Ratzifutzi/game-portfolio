local DataStoreService = game:GetService("DataStoreService")
local experienceStore = DataStoreService:GetDataStore("PlayerExperience")

game.Players.PlayerAdded:Connect(function(player)
	
	
	
	local leaderstats = player:WaitForChild("leaderstats")
	local rank = Instance.new("StringValue")
	rank.Name="Rank"
	rank.Value="Player"
	rank.Parent=leaderstats
	local success, err = pcall(function()
		local playerfolder = script.Parent:FindFirstChild(player.Name)
		local value = playerfolder:WaitForChild("Rank")
		rank.Value=value.Value
	end)
	
	
end)
