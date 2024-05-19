

script.Value.Value.TriggerEnded:Connect(function()
	playerrank = game.Players.LocalPlayer:WaitForChild("PlayerData"):WaitForChild("level")

	if playerrank.Value > 15 then
		game.ReplicatedStorage.RemoteEvents.ECS:FireServer()
	end
end)



while true do
	wait()
	playerrank = game.Players.LocalPlayer:WaitForChild("PlayerData"):WaitForChild("level")
	
	if playerrank.Value < 15 then
		script.Value.Value.ActionText = "LEVEL UP FIRST"
	else
		if workspace.Values.ECS.Triggered.Value == false then
			if workspace.Values.ECS.GlassBroken.Value == false then
				script.Value.Value.ActionText = "BREAK SAFETY-GLASS"
				script.Value.Value.HoldDuration = .5
			else
				script.Value.Value.ActionText = "TRIGGER SHUTDOWN"
				script.Value.Value.HoldDuration = 3
			end
		else
			script.Value.Value.ActionText = "ALREADY USED"
			script.Value.Value.HoldDuration = 0
		end
	end
end
