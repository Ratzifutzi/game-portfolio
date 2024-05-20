local event = {}

event["listening"] = game.ReplicatedStorage.Functions.CtS.EnterArena -- Function here

event["function"] = function (player:Player)
	if player["UserData"]["InBossFight"].Value then return false end
	
	player.Character.HumanoidRootPart.CFrame = workspace.Interactive.BossFight.SpawnPoint.CFrame
	player["UserData"]["InBossFight"].Value = true
	
	return true
end

return event
