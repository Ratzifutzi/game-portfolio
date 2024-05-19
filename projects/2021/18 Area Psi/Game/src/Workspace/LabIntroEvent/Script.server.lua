workspace.Events.Intro.Lab.Event:Connect(function()
	script.Parent.Waypoints.CurrentWaypoint.Value = 1
	script.Parent.Shock:Play()
	script.Parent.Lamps:Play()
	workspace.PlayerClearence.Value = 3 
	script.Parent.Music:Play()
end)