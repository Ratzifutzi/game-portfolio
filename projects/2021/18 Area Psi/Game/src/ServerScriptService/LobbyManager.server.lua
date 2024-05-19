DSS = game:GetService("DataStoreService")
LS = DSS:GetDataStore("Lobby", "Singleplayer")

game.Players.PlayerAdded:Connect(function(plr)
	game.ReplicatedStorage.ManageUI:FireClient(plr, true)
	local success, currentdata = pcall(function()
		return LS:GetAsync(plr.Name)
	end)
	if success then
		if os.date("%x") == currentdata["Date"] then
			local SavedTimeTable = string.split(currentdata["Time"], ":")
			local CurrentTimeTable = string.split(os.date("%X"), ":")
			
			print(SavedTimeTable[1])
			print(CurrentTimeTable[1])

			if SavedTimeTable[1] == CurrentTimeTable[1] then
				if tonumber(SavedTimeTable[2]) + 5 >= tonumber(CurrentTimeTable[2]) then
					print("LOBBY ALRIGHT")
					print("LOBBY CREATED " .. CurrentTimeTable[1] - SavedTimeTable[1] .. "h " .. CurrentTimeTable[2] - SavedTimeTable[2] .. "min " .. CurrentTimeTable[3] - SavedTimeTable[3] .. "s ago.")
					wait(5)
					if currentdata["Intro"] == true then
						workspace.Events.PreIntro:Fire()
						workspace.Events.PreIntro.FireToLocal:FireAllClients()
					else
						workspace.Events.Intro.Lab:Fire()
						workspace.Events.Intro.Lab.FireToLocal:FireAllClients()
					end
				else
					workspace.DevConsole.SendMessageToClient:FireClient(plr, "Lobby outdated", "The lobby you want to use is outdated.", 10)
					print("LOBBY OUTDATED")
					print("LOBBY CREATED " .. CurrentTimeTable[1] - SavedTimeTable[1] .. "h " ..  CurrentTimeTable[2] - SavedTimeTable[2] .. "min " .. CurrentTimeTable[3] - SavedTimeTable[3] .. "s ago.")
				end
			else
				workspace.DevConsole.SendMessageToClient:FireClient(plr, "Lobby outdated", "The lobby you want to use is outdated.", 10)
				print("LOBBY OUTDATED")
				print("LOBBY CREATED " .. CurrentTimeTable[1] - SavedTimeTable[1] .. "h " ..  CurrentTimeTable[2] - SavedTimeTable[2] .. "min " .. CurrentTimeTable[3] - SavedTimeTable[3] .. "s ago.")
			end
		else
			workspace.DevConsole.SendMessageToClient:FireClient(plr, "Lobby outdated", "The lobby you want to use is outdated.", 10)
			print("LOBBY OUTDATED")
			print("LOBBY CREATED DAYS AGO")
		end
		game.ReplicatedStorage.ManageUI:FireClient(plr, false)
	else
		warn("Error Loading Data")
	end
end)

