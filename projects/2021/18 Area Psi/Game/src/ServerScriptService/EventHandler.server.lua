workspace.Events.PreIntro.Event:Connect(function()
	workspace.PlayerClearence.Value = 3
	workspace.TrainStationEvent.FakeDoorHallWay.SpawnTrigger.Transparency = 1
	for key, value in pairs(workspace.TrainStationEvent.FakeDoorHallWay:GetDescendants()) do
		if value:IsA("Part") or value:IsA("MeshPart") then
			value.Transparency = 1
			value.CanCollide = false
		elseif value:IsA("SurfaceLight") then
			value.Enabled = false
		elseif value:IsA("SurfaceGui") then
			value.Enabled = false
		end
	end
end)

workspace.TrainStationEvent.FakeDoorHallWay.SpawnTrigger.Touched:Connect(function()
	for key, value in pairs(workspace.TrainStationEvent.FakeDoorHallWay:GetDescendants()) do
		if value:IsA("Part") or value:IsA("MeshPart") then
			value.Transparency = 0
			value.CanCollide = true
		elseif value:IsA("SurfaceLight") then
			value.Enabled = true
		elseif value:IsA("SurfaceGui") then
			value.Enabled = true
		end
	end
	workspace.TrainStationEvent.FakeDoorHallWay.SpawnTrigger.CanCollide = false
	workspace.TrainStationEvent.FakeDoorHallWay.SpawnTrigger.Transparency = 1
end)