game.Players.PlayerAdded:Connect(function(plr)
	wait(2)
	plr.Backpack.ChildAdded:Connect(function(Child)
		local Childs = plr.Backpack:GetChildren()
		Childs = #Childs
		wait()
		if Childs >= 3 then
			warn("Tool Limit")
			Child.Parent = workspace.ToolStorage
			Child.Handle.CFrame = plr.Character.Head.CFrame * CFrame.new(Vector3.new(0,0,-7))
			game.ReplicatedStorage.SendMessageToClient:FireClient(plr, "Inventory full", "You can only have 3 items in your inventory.", 3)
		end
	end)
end)