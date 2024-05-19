

local DataStoreService = game:GetService("DataStoreService")
local experienceStore = DataStoreService:GetDataStore("PlayerExperience")


game.Players.PlayerAdded:Connect(function(player)
	local success, currentExperience = pcall(function()
		return experienceStore:GetAsync(player.UserId.."-playtime")
	end)
	
	
	local leaderstats = Instance.new("Folder")
	leaderstats.Name="leaderstats"
	leaderstats.Parent=player
	local playtime=Instance.new("IntValue")
	playtime.Name="Minutes Played"
	playtime.Parent=leaderstats
	local setting = Instance.new("Folder")
	setting.Name="settings"
	setting.Parent=player
	local keylevel = Instance.new("IntValue")
	keylevel.Name="keylevel"
	keylevel.Parent=setting
	keylevel.Value=0
	
	
	
	if success then
		playtime.Value=currentExperience
	end
	
	while true do
		wait(60)
		local success, newExperience = pcall(function()
			return experienceStore:IncrementAsync(player.UserId.."-playtime", 1)
		end)
		
		local success, currentExperience = pcall(function()
			return experienceStore:GetAsync(player.UserId.."-playtime")
		end)
		
		if success then
			playtime.Value=currentExperience
		end
	end
	
end)

--[[
local success, err = pcall(function()
	experienceStore:SetAsync("Player_1234", 50)
end)

if success then
	print("Success!")
end

local success, newExperience = pcall(function()
	return experienceStore:IncrementAsync("Player_1234", 1)
end)

if success then
	print("New Experience:", newExperience)
end

---[[
local success, currentExperience = pcall(function()
	return experienceStore:GetAsync("Player_1234")
end)

if success then
	print("Current Experience:", currentExperience)
end
--]]