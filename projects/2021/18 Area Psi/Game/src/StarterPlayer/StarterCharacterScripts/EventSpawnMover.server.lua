workspace.Events.Intro.Lab.Event:Connect(function()
	local char = script.Parent
	local HumanoidRootPart = char.HumanoidRootPart
	HumanoidRootPart.CFrame = workspace:WaitForChild("LabIntroEvent").Spawn.CFrame
end)

workspace.Events.DeathEvent.Event:Connect(function()
	local char = script.Parent
	local HumanoidRootPart = char.HumanoidRootPart
	HumanoidRootPart.CFrame = workspace.DeathEvent.Spawn.CFrame
end)

workspace.Events.PreIntro.Event:Connect(function()
	local char = script.Parent
	local HumanoidRootPart = char.HumanoidRootPart
	HumanoidRootPart.CFrame = workspace:WaitForChild("TrainStationEvent").Spawn.CFrame
end)
