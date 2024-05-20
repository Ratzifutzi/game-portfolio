local event = {}

event["listening"] = game.ReplicatedStorage.Events.StS.RevivePlayer.Event -- Function here

local function giveForcefield(player, duration)
	local character = player.Character
	if character then
		local forceField = Instance.new("ForceField")
		forceField.Visible = true
		forceField.Parent = character
		if duration then
			task.delay(duration, function()
				if forceField then
					forceField:Destroy()
				end
			end)
		end
	end
end

event["function"] = function (player:Player)
	player:LoadCharacter()
	player.Character:SetPrimaryPartCFrame( workspace.Interactive.BossFight.SpawnPoint.CFrame )
	player["UserData"]["InBossFight"].Value = true

	giveForcefield( player, 10 )
end

return event
