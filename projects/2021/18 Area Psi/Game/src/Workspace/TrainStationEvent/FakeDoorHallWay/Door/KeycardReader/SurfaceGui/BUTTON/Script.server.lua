script.Parent.MouseButton1Click:Connect(function()
	workspace.Events.Intro.Lab:Fire()
	workspace.Events.Intro.Lab.FireToLocal:FireAllClients()
	workspace.TrainStationEvent.TrainStationMusic:Stop()
	
end)

--[[ ONLY REQ. IF BUTTON CLONE

script.Parent.Parent.Parent.Parent.Part.SurfaceGui.BUTTON.Changed:Connect(function()
	script.Parent.Text = script.Parent.Parent.Parent.Parent.Part.SurfaceGui.BUTTON.Text
	script.Parent.TextColor3 = script.Parent.Parent.Parent.Parent.Part.SurfaceGui.BUTTON.TextColor3
end)

]]--