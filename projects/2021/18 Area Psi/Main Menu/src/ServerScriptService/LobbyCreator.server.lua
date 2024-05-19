dss = game:GetService("DataStoreService")
LS = dss:GetDataStore("Lobby", "Singleplayer")
tps = game:GetService("TeleportService")

game.ReplicatedStorage.CreateSPgame.OnServerEvent:Connect(function(sender, EnableIntro, DevConsole)
	
	local success, err = pcall(function()
		LS:SetAsync(sender.Name, {["Intro"] = EnableIntro, ["DevConsole"] = DevConsole, ["Date"] = os.date("%x"), ["Time"] = os.date("%X")})
	end)
	
	if success then
		tps:TeleportAsync(9558970957, {sender})
	else
		warn(err)
	end
end)