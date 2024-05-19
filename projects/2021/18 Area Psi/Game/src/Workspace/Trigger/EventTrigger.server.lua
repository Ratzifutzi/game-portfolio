script.Parent.Transparency = 1

script.Parent.Touched:Connect(function()
	workspace.Events.Intro.Lab:Fire()
	workspace.Events.Intro.Lab.FireToLocal:FireAllClients()
end)