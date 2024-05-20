local event = {}

event["listening"] = game.ReplicatedStorage.Events.CtS.RespawnUser.OnServerEvent -- Function here

event["function"] = function (player:Player)
	player.Character.Humanoid.Health = 100
	
	player:LoadCharacter()
end

return event
