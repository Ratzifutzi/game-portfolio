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
	
	local maxEquipLoadValue = AddInstance( Instance.new("NumberValue"), userDataFolder, {
		["Name"] = "MaxEquipLoad",
		["Value"] = 50
	} )
end

return event
