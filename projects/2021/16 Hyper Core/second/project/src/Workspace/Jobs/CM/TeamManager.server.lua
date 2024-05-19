team = Instance.new("Team")
team.TeamColor = script.Parent.Color.Value
team.Name = script.Parent.Name
team.Parent = game.Teams
team.AutoAssignable = false

dss = game:GetService("DataStoreService")
lvls = dss:GetDataStore(script.Parent.Name.. "LevelStore")

script.Parent.AddUser.OnServerEvent:Connect(function(User)
	print("Adding ".. User.Name .. " to ".. script.Parent.Name)
	
	print("Getting Level for Job ".. script.Parent.Name)
	
	local CurrentXp = lvls:GetAsync("CurrentXp")
	local CurrentLevel = lvls:GetAsync("CurrentLevel")
	
	if CurrentLevel == 0 or CurrentLevel == nil then
		CurrentLevel = 1
	end
	
	User.PlayerData.level.Value = CurrentLevel
	User.PlayerData.xp.Value = CurrentXp
	
	User.Team = game.Teams:FindFirstChild(script.Parent.Name)
end)