player = game.Players.LocalPlayer
playerXp = player:FindFirstChild("PlayerData"):FindFirstChild("xp")
playerLevel = player:FindFirstChild("PlayerData"):FindFirstChild("level")

while true do
	wait()
	script.Parent.Text = "XP: ".. playerXp.Value .. " / " .. tostring(5 * playerLevel.Value)
end