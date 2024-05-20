ReplicatedStorage = game:GetService("ReplicatedStorage")
Lighting = game:GetService("Lighting")
TweenService = game:GetService("TweenService")

Config = require( ReplicatedStorage.Configuration )

local module = {}

function module:Play( args : {} )
	Lighting.ClockTime = Config.Lighting.Morning
	
	local timeTween = TweenService:Create( game.Lighting, TweenInfo.new( Config.Timers.DayDuration, Enum.EasingStyle.Linear ), {
		ClockTime = Config.Lighting.Evening
	} ):Play()
end

return module
