local Players = game:GetService("Players")

game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAppearanceLoaded:Connect(function(character)
		local humanoid = character:WaitForChild("Humanoid")
		humanoid:RemoveAccessories()
		humanoid:AddAccessory(script.Hair:Clone())
	end)
end)
	
		
		