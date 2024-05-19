player = game.Players.LocalPlayer
playerXp = player:FindFirstChild("PlayerData"):FindFirstChild("xp")
playerLevel = player:FindFirstChild("PlayerData"):FindFirstChild("level")


if player:IsInGroup(8623855) then
	local rankString = player:GetRoleInGroup(8623855)
	script.Parent.Text = rankString
elseif not player:IsInGroup(8623855) then
	print("Player is not in group "..tostring(8623855))
	script.Parent.Text = "Guest"
end