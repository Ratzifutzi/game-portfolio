local event = {}

event["listening"] = game.Players.PlayerAdded

event["event"] = function (player:Player)
	player.CharacterAdded:Connect(function( char )
		player["UserData"]["InBossFight"].Value = false
		
		char:WaitForChild("Humanoid").Died:Connect(function()
			if player["UserData"]["InBossFight"].Value then
				player["UserData"]["CanReviveTill"].Value = DateTime.now().UnixTimestamp + 15
			else
				player:LoadCharacter()
			end
		end)
	end)
end

return event
