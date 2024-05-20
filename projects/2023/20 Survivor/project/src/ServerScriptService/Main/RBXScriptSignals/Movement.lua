ReplicatedStorage = game.ReplicatedStorage
StarterPlayer = game.StarterPlayer

Config = require(ReplicatedStorage.Configuration)

local event = {}

event["listening"] = game.Players.PlayerAdded

event["event"] = function (player:Player)
	
end

return event
