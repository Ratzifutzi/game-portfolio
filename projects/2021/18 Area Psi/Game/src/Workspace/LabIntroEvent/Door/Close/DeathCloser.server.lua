workspace.Events.DeathEvent.Event:Connect(function()
	if script.Parent.Parent.Openv.Value == true then
		script.Parent:Fire()
		script.Parent.Parent.Door.Volume = 0
		wait(1.7)
		script.Parent.Parent.Door.Volume = 1
	end
end)