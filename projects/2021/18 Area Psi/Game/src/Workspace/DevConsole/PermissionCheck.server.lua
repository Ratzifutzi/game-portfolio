DSS = game:GetService("DataStoreService")
PermissionStore = DSS:GetDataStore("SecuretyStore", "Permissions")
PurchaseStore = DSS:GetDataStore("PlayerData", "Pruchases")

game.Players.PlayerAdded:Connect(function(plr)
	local Rank = Instance.new("ObjectValue")
	Rank.Value = workspace.DevConsole.PermissionGroups.Guest
	Rank.Name = "Rank"
	Rank.Parent = plr

	print("Checking Permission for: ".. plr.Name)
	local success, DataStoreRank = pcall(function()
		return PermissionStore:GetAsync(plr.UserId)
	end)
	if DataStoreRank == nil then
		DataStoreRank = workspace.DevConsole.PermissionGroups.Guest
	else
		local success, err = pcall(function()
			DataStoreRank = workspace.DevConsole.PermissionGroups:FindFirstChild(DataStoreRank)
		end)
		if err then
			DataStoreRank = workspace.DevConsole.PermissionGroups.Guest
		end
	end
	if DataStoreRank == nil then
		DataStoreRank = workspace.DevConsole.PermissionGroups.Guest
	end
	print(DataStoreRank)
	Rank.Value = DataStoreRank
	workspace.DevConsole.UserLevel.Value = Rank.Value.Name
	
	local success, currentPurchases = pcall(function()
		return PurchaseStore:GetAsync(plr.UserId)
	end)
	if currentPurchases["DevConsole"] then
		if workspace.DevConsole.UserLevel.Value == "Guest" then
			workspace.DevConsole.UserLevel.Value = "Gamepass"
		end
	end
end)

script.Parent.UserLevel.Changed:Connect(function()
	if script.Parent.DoesServerHasDevconsoleEnabled.Value == false then
		script.Parent.UserLevel.Value = "Guest"
		print("DEVELOPER CONSOLE DISABLED")
	end
end)