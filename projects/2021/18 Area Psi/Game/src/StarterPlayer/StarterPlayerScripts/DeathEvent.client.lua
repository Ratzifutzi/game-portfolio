
workspace.Events.DeathEvent.FireToLocal.OnClientEvent:Connect(function()
	repeat
		wait()
	until workspace.DeathEvent.Uplifter.TimePosition > 27
	print("boom")
end)