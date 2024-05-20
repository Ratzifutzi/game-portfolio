local event = {}

event["listening"] = game.Players.PlayerAdded

function AddInstance( ins : Instance, parent : Instance, attributes : {} )
	for k, v in pairs( attributes ) do
		ins[k] = v
	end

	ins.Parent = parent
	return ins
end

event["event"] = function (player:Player)
	local userDataFolder = AddInstance( Instance.new("Folder"), player, {
		["Name"] = "UserData"
	} )

	local maxEquipLoadValue = AddInstance( Instance.new("BoolValue"), userDataFolder, {
		["Name"] = "InBossFight",
		["Value"] = true
	} )

	local canReviveTill = AddInstance( Instance.new("NumberValue"), userDataFolder, {
		["Name"] = "CanReviveTill"
	} )

	player:LoadCharacter()
end

return event
