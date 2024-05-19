script.Parent.Visible = false
player = game.Players.LocalPlayer
playerXp = player:FindFirstChild("PlayerData"):FindFirstChild("xp")
playerLevel = player:FindFirstChild("PlayerData"):FindFirstChild("level")

while true do
	wait()
	script.Parent.Level.Text = "LEVEL ".. playerLevel.Value + 1
	if playerXp.Value == playerLevel.Value * 5 then
		script.Parent.Visible = true
		workspace.Sounds.LevelUp:Play()
		wait(workspace.Sounds.LevelUp.TimeLength)
		wait(.2)
		script.Parent.Visible = false
	end
end