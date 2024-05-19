workspace.Events.Intro.Lab.FireToLocal.OnClientEvent:Connect(function()
	game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
end)

workspace.Events.PreIntro.FireToLocal.OnClientEvent:Connect(function()
	game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
end)

game.StarterGui.ResetPlayerGuiOnSpawn = false