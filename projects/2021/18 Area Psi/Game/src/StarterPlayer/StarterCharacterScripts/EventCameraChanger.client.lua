workspace.Events.Intro.Lab.FireToLocal.OnClientEvent:Connect(function()
	workspace.CurrentCamera.CFrame = workspace:WaitForChild("LabIntroEvent").Spawn.CFrame
end)

workspace.Events.PreIntro.FireToLocal.OnClientEvent:Connect(function()
	workspace.CurrentCamera.CFrame = workspace.TrainStationEvent.Spawn.CFrame
end)