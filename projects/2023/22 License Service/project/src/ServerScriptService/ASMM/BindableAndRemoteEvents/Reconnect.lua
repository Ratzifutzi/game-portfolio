local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local event = {}

event["listening"] = ReplicatedStorage.Events.CtS.Reconnect.OnServerEvent -- Function here

event["function"] = function (player:Player)
	local accessKey = xpcall( function()
		local accessKey = TeleportService:ReserveServer( game.PlaceId )
		
		TeleportService:TeleportToPrivateServer( game.PlaceId, accessKey, { player } )

		task.wait(10)

		error("Teleport timed out.")
	end, function(err)
		player:Kick( string.format( "Automatic reconnect failed. Please reconnect using the button in this menu. %s", err ) )
	end)
end

return event
