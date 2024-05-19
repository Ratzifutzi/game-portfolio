local RunService = game:GetService("RunService")

local Player = game.Players.LocalPlayer

local TimerModule = require(game.ReplicatedStorage.Modules.NumberToClocktime)

RunService.RenderStepped:Connect(function()
	script.Parent.Time.Text = TimerModule.trasferTo_MM_SS_MS(tick() - Player["Data"]["TimerStarted"].Value, ":", 2)
	
	if Player["Data"]["TimerStarted"].Value == "-1" then
		script.Parent.Time.Text = "00:00:00"
	else
		if Player["Data"]["TimerEnded"].Value ~= "-1" then
			script.Parent.Time.Text = TimerModule.trasferTo_MM_SS_MS(Player["Data"]["TimerEnded"].Value - Player["Data"]["TimerStarted"].Value, ":", 2)
		end
	end
end)