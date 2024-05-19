player = game.Players.LocalPlayer
playerLevel = player:FindFirstChild("PlayerData"):FindFirstChild("level")

while true do
	wait()
	script.Parent.Text = "- LEVEL ".. playerLevel.Value .. " -"
end