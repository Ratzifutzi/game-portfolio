workspace.Events.DeathEvent.Event:Connect(function()
	script.Parent.End.TimePosition = .2
	workspace.PlayerClearence.Value = 0
	workspace.LabIntroEvent.Music:Stop()
	workspace.LabIntroEvent.Lamps:Stop()
	script.Parent.KilledA:Play()
end)