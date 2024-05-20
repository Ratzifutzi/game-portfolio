RunService = game:GetService("RunService")

local TEXT_LABEL = script.Parent:WaitForChild("Countdown"):WaitForChild("TextLabel")

RunService.RenderStepped:Connect(function()
	local timeLeft = math.max( 0, workspace.Values.NextFightAt.Value - DateTime.now().UnixTimestamp )
	
	if timeLeft ~= 0 then
		local formatted = os.date("!*t", timeLeft)
		
		TEXT_LABEL.Text = string.format( "%im%is", formatted["min"], formatted["sec"] )
	else
		TEXT_LABEL.Text = "Fight ongoing"
	end
end)