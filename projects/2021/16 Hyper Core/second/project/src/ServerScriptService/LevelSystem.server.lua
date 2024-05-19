game.Players.PlayerAdded:Connect(function(plr)
	wait(2)
	
	
	
	plr.PlayerData.xp.Changed:Connect(function()
		local xp = plr.PlayerData.xp
		local job = plr.Team
		local level = plr.PlayerData.level
		local maxxpval = plr.PlayerData.maxxp
		
		
		local jobfolder = workspace.Jobs:FindFirstChild(tostring(job))
		local levelfolder = jobfolder.Ranks:FindFirstChild(tostring(level.Value))
		
		local maxXp = levelfolder:FindFirstChild("MaxXp")
		
		
		maxxpval.Value = maxXp.Value
		
	end)
	
	
end)