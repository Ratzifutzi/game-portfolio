script.Parent.Transparency = 1
Touching = false
Touches = 0
script.Parent.Touched:Connect(function()
	if Touching == false then
		Touching = true
		Touches = Touches + 1
		if Touches == 1 then
			workspace.DevConsole.SendMessageToClient:FireAllClients("haha, nice bug 7w7", "But please get down. i dont have time to warn u forever", 5)
		end
		if Touches == 2 then
			workspace.DevConsole.SendMessageToClient:FireAllClients("Stop please", "i dont want to warn u for ever", 5)
		end
		if Touches == 3 then
			workspace.DevConsole.SendMessageToClient:FireAllClients("its not funny anymore", "soo, please stop and go", 5)
		end
		if Touches == 4 then
			workspace.DevConsole.SendMessageToClient:FireAllClients("JUST GET DOWN- PLEASE--", " THIS IS NOT WHAT IT IS MADE FOR :(/", 5)
		end
		if Touches == 5 then
			workspace.DevConsole.SendMessageToClient:FireAllClients("IF U DO THAT AGAIN UR DED", "CMON STOP PLEASE", 5)
		end
		if Touches == 6 then
			workspace.DevConsole.SendMessageToClient:FireAllClients("UR VERRYYYY LAST WARNING", "OR UR BANNED", 5)
		end
		if Touches == 7 then
			workspace.DevConsole.SendMessageToClient:FireAllClients("Good bye.", ":)", 5)
			wait(2)
			workspace.Events.DeathEvent:Fire()
			workspace.Events.DeathEvent.FireToLocal:FireAllClients()
		end
		wait(2)
		Touching = false
	end
end)