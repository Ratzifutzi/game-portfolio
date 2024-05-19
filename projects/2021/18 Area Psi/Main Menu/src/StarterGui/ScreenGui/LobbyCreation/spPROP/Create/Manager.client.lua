script.Parent.MouseButton1Click:Connect(function()
	script.Disabled = true
	
	
	local clone = workspace.Music:Clone()
	clone:Play()
	clone.TimePosition = 254
	clone.Name = "clone"
	clone.Parent = workspace

	for i = 0,100 do
		workspace.Music.Volume = 1 - i / 100
		clone.Volume = i / 100
		wait(0.01)
	end	
	
	workspace.Music.Looped = false
	clone.Looped = false
	
	repeat wait()
		print("waitng")
	until clone.TimePosition > 259
	
	script.Parent.Parent.Parent.Parent.Fullscreen.BackgroundTransparency = 0
	
	wait(2)
	
	local TPUI = game.StarterGui.TeleportScreen:Clone()
	local TPS = game:GetService("TeleportService")
	
	
	local RS = game:GetService("RunService")

	TPUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	TPS:SetTeleportGui(TPUI)
	TPUI.Enabled = true
		
	local IntroSeq = false
	local DevConsol = false
	if script.Parent.Parent.Settings.EnableIntro.Text == "X" then IntroSeq = true end
	if script.Parent.Parent.Settings.EnableCheats.Text == "X" then DevConsol = true end

	game.ReplicatedStorage.CreateSPgame:FireServer(IntroSeq, DevConsol)
	
end)