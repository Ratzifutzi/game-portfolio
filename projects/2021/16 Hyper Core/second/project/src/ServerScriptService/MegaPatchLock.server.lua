game.Players.PlayerAdded:Connect(function(plr)
	local tps = game:GetService("TeleportService")
	
	if not plr.Name == "Ratzifutzi" then
		tps:TeleportAsync(6841808342, {plr})
	end
end)