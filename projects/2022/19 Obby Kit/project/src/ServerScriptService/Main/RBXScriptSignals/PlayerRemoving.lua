DataStoreService = game:GetService("DataStoreService")
PlayerDataStore = DataStoreService:GetDataStore("data")

local module = {}

module.signal = game.Players.PlayerRemoving

function module.event(player:Player)
	--Save Player Data
	local dataToSave = {}
	local _playerData:Folder = player["Data"]
	
	for k, v in pairs(_playerData:GetChildren()) do
		dataToSave[v.Name] = v.Value
	end
	
	local success, err = pcall(function()
		PlayerDataStore:SetAsync( player.UserId, dataToSave )
	end)
	if success then print("Saved Data Successfully for " .. player.Name .. "!") end
	
	if err then warn(err) end
end

return module
