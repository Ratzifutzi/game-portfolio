
tps = game:GetService("TeleportService") 


game.ReplicatedStorage.RemoteEvents.Admin.SetTemp.OnServerEvent:Connect(function(plr, val)
	local permissionsfolder = game.Workspace.Securety.Admin:WaitForChild(plr.Name).Permissions
	if permissionsfolder.ChangeTemp.Value == true then
		if tonumber(val) then
			game.Workspace.Values.Core.Temp.Value = tonumber(val)
		end
	end
end)

game.ReplicatedStorage.RemoteEvents.ECS.OnServerEvent:Connect(function(plr)
	local playerrank = plr:WaitForChild("PlayerData"):WaitForChild("level")
	
	if playerrank.Value > 15 then
		if workspace.Values.ECS.Triggered.Value == false then
			if workspace.Values.ECS.GlassBroken.Value == true then
				script.ECS.Value.ProximityPrompt.ProximityPrompt.Enabled = false	
				workspace.Values.ECS.TriggerECS.Value = true
				wait(1)
				script.ECS.Value.ProximityPrompt.ProximityPrompt.Enabled = true
			else
				script.ECS.Value.ProximityPrompt.ProximityPrompt.Enabled = false				
				script.ECS.Value.Glass.Transparency = 1
				script.ECS.Value.Glass.Sound:Play()
				
				workspace.Values.ECS.GlassBroken.Value = true
				wait(1)
				script.ECS.Value.ProximityPrompt.ProximityPrompt.Enabled = true
			end
		end
	end
end)

game.ReplicatedStorage.RemoteEvents.BetaSite.SetLevel.OnServerEvent:Connect(function(plr, val)
	if game.PlaceId == 6735578884 then
		if playerfolder:FindFirstChild(plr.Name):FindFirstChild("BetaTester") then
			if playerfolder:FindFirstChild(plr.Name):FindFirstChild("BetaTester").Value == true then
				if tonumber(val) then
					plr:WaitForChild("PlayerData"):WaitForChild("level").Value = val
				end
			end
		end
	end
end)

game.ReplicatedStorage.RemoteEvents.StartPlusTrial.OnServerEvent:Connect(function(sender)
	
	local dss = game:GetService("DataStoreService")
	local ps = dss:GetDataStore("PlusStore")
	
	
	local ActivatedTestBefore = ps:GetAsync(sender.Name.."-ActivatedTestBefore")
	local owningPlus = ps:GetAsync(sender.Name.."-OwningPlus")
	local TestTrialActive = ps:GetAsync(sender.Name.."-ActiveTestTrial")
	local TestTrialActivation = ps:GetAsync(sender.Name.."-ActivationDate")
	
	if TestTrialActive == false or TestTrialActive == nil then
		ps:SetAsync(sender.Name.. "-OwnedPlus", false)
		if owningPlus == false or owningPlus == nil then
			ps:SetAsync(sender.Name.. "-OwningPlus", false)
			
			if ActivatedTestBefore == false or ActivatedTestBefore == nil then
				
				ps:SetAsync(sender.Name.."-ActivatedTestBefore", true)
				ps:SetAsync(sender.Name.."-ActiveTestTrial", true)
				ps:SetAsync(sender.Name.."-ActivationDateDay", os.time("%d"))
				
				print(os.date)
				
			end
			
		end
	end
	
end)


game.Players.PlayerAdded:Connect(function(plr)
	local dss = game:GetService("DataStoreService")
	local ps = dss:GetDataStore("PlusStore")


	local ActivatedTestBefore = ps:GetAsync(plr.Name.."-ActivatedTestBefore")
	local owningPlus = ps:GetAsync(plr.Name.."-OwningPlus")
	local TestTrialActive = ps:GetAsync(plr.Name.."-ActiveTestTrial")
	
	local ActivationDateTable = ps:GetAsync(plr.Name.."-ActivationDateDay")
	
	if ActivationDateTable == nil then
		ActivationDateTable = 27
	end
	
	if TestTrialActive == true then
		if ActivationDateTable >= tonumber(os.date("%d")) + 4 or ActivationDateTable <= tonumber(os.date("%d")) - 2 then
			print("Remove Test Trial")
		else
			print("Test Trial active for: ".. os.date("%d") - ActivationDateTable + 1 .. " - Activated: ".. ActivationDateTable)
		end
		
		local fold = Instance.new("Folder")
		fold.Parent = game.Workspace.FreeGamepassUser
		fold.Name = plr.Name
		
		local ins = Instance.new("Folder")
		ins.Name = "TestTrial"
		ins.Parent = fold
		
		print("ActivatedTestTrial Features for ".. plr.Name)
	end
end)