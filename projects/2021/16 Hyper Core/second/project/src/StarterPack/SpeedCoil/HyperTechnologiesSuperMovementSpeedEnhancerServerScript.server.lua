script.Parent.Unequipped:Connect(function()
	local plr = script.Parent.Parent.Parent
	local char = workspace:FindFirstChild(plr.Name)
	local humanoid = char:FindFirstChild("Humanoid")
	humanoid.WalkSpeed = humanoid.WalkSpeed / 3
end)

script.Parent.Equipped:Connect(function()
	local plr = script.Parent.Parent
	local char = workspace:FindFirstChild(plr.Name)
	local humanoid = char:FindFirstChild("Humanoid")
	humanoid.WalkSpeed = humanoid.WalkSpeed * 3
end)

