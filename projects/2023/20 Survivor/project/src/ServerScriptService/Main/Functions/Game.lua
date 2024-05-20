ReplicatedStorage = game:GetService("ReplicatedStorage")

Config = require( ReplicatedStorage.Configuration )

local module = {}

module.StartGame = function()
	workspace.Values.CurrentGameState.Value = "day"
	workspace.Values.NextEventAt.Value = DateTime.now().UnixTimestamp + Config.Timers.DayDuration
	
	ReplicatedStorage.Events.ServerToClient.PlayVisuals:FireAllClients( "DayCycle", {} )
end

return module
