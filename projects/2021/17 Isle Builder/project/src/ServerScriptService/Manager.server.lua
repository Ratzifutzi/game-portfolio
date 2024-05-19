DSS = game:GetService("DataStoreService")
DataStore = DSS:GetDataStore("PlayerData", "BuildStore")
HTTPService = game:GetService("HttpService")
TweenService = game:GetService("TweenService")

CurrentBuildStore = {}

imgBuildStore = {
	["TestObj1x1@1"] = {["x"] = 0, ["z"] = 0, ["plot"] = "MainBase", ["otherVals"] = {}}
}

imgInvStore = {
	["TestObj1x1"] = {["Amount"] = 1}
}

function SplitName(text)
	return string.split(text, "@")[1]
end

game.Players.PlayerAdded:Connect(function(plr)	
	
	local BuildInv = Instance.new("Folder")
	BuildInv.Parent = plr
	BuildInv.Name = "BuildInv"
	
	--// Request Builded Stuff
	local DataStore = DSS:GetDataStore("PlayerData", "BuildStore")
	local succes, CurrentJSONbuildStore = pcall(function()
		return DataStore:GetAsync(plr.UserId)
	end)
	if not succes then
		
	end
	if CurrentJSONbuildStore == nil then
		CurrentJSONbuildStore = imgBuildStore
	else
		CurrentJSONbuildStore = HTTPService:JSONDecode(CurrentJSONbuildStore)
	end
	for key, value in pairs(CurrentJSONbuildStore) do
		local InsToLoad = game.ReplicatedStorage.AvaibleObjects:FindFirstChild(SplitName(key))
		InsToLoad = InsToLoad:Clone()
		local RootPart = InsToLoad.Root
		local X = InsToLoad.PosX
		local Z = InsToLoad.PosZ
		
		local SaveX = value["x"]
		local SaveZ = value["z"]
		local SavePlot = value["plot"]
		local OtherValsTable = value["otherVals"]
		if HTTPService:JSONDecode(OtherValsTable)then
			OtherValsTable = HTTPService:JSONDecode(OtherValsTable)
		end
		--warn(OtherValsTable)
		for key, value in pairs(OtherValsTable) do
			local valueType = InsToLoad.OtherVals:FindFirstChild(key)
			valueType.Value = value
		end
		
		X.Value = SaveX
		Z.Value = SaveZ
		
		InsToLoad.Plot.Value = SavePlot
		
		--RootPart.CFrame = workspace.Plot.gridsys.Grids:WaitForChild(SaveX.."-" .. SaveZ .. "-" .. SavePlot).CFrame
		
		local TI = TweenInfo.new(0.01, Enum.EasingStyle.Linear)
		local RootMovePart = InsToLoad.Root
		local goal = {CFrame = workspace.Plot.gridsys.Grids:WaitForChild(SaveX.."-" .. SaveZ .. "-" .. SavePlot).CFrame}
		--warn(workspace.Plot.gridsys.Grids:WaitForChild(SaveX.."-" .. SaveZ .. "-" .. SavePlot).CFrame)

		local MoveTween = TweenService:Create(RootMovePart, TI , goal)

		MoveTween:Play()
		
		workspace.Plot.gridsys.Grids:WaitForChild(SaveX.."-" .. SaveZ .. "-" .. SavePlot).GridUsed.Value = true
		for i = 0, InsToLoad.SizeX.Value do
			for u = 0, InsToLoad.SizeZ.Value do
				workspace.Plot.gridsys.Grids:WaitForChild(SaveX + u.."-" .. SaveZ  .. "-" .. SavePlot).GridUsed.Value = true
			end
			workspace.Plot.gridsys.Grids:WaitForChild(SaveX .."-" .. SaveZ + i .. "-" .. SavePlot).GridUsed.Value = true
		end
		
		InsToLoad.Parent = workspace.Plot.PruchasedObj
	end
	
	--// Request Inventory

	local DataStore = DSS:GetDataStore("PlayerData", "InvStore")

	local succes, CurrentJSONinvStore = pcall(function()
		return DataStore:GetAsync(plr.UserId)
	end)
	--warn(CurrentJSONinvStore)
	if CurrentJSONinvStore == nil then
		CurrentJSONinvStore = imgInvStore
	else
		if type(CurrentJSONinvStore) == "table" then
			warn(" ! IMPORTANT ! - SAVE DATA MAYBE MODIFIED BY ADMIN")
			game.ReplicatedStorage.ReportErrorToLocal:FireClient(plr ,Color3.fromRGB(255, 225, 0), "Save Data Modified", "Your save data may have been modified by an administrator. This is not a problem, but if all your saved data is lost, contact the Hyper Technologies High Administrative Team. This includes: Ratzifutzi, AaronTheFluff.")
		else
			CurrentJSONinvStore = HTTPService:JSONDecode(CurrentJSONinvStore)
		end
	end
--	warn(CurrentJSONinvStore)
	for key, value in pairs(CurrentJSONinvStore) do
		local ins = Instance.new("Folder")
		ins.Parent = BuildInv
		ins.Name = key
		
		--warn(HTTPService:JSONEncode(value))
		--warn(key)
		
		for key2, value2 in pairs(value) do
			--warn(" >".. key2)
			--warn(" >".. value2)
			local insval = nil
			if tonumber(value2) then
				insval = Instance.new("NumberValue")
			else
				insval = Instance.new("StringValue")
			end
			insval.Parent = ins
			insval.Name = key2
			insval.Value = value2
		end
	end
	
end)

OtherValsTable = {}
game.Players.PlayerRemoving:Connect(function(plr)
	--// Save Buildings
	local DataStore = DSS:GetDataStore("PlayerData", "BuildStore")
	for key, value in pairs(workspace.Plot.PruchasedObj:GetChildren()) do
		local OtherValsTable = {}
		for key, value in pairs(value.OtherVals:GetChildren()) do
			OtherValsTable[value.Name] = value.Value
		end
		OtherValsTable = HTTPService:JSONEncode(OtherValsTable)
		CurrentBuildStore[value.Name .. "@" .. key] = {["x"] = value.PosX.Value, ["z"] = value.PosZ.Value, ["plot"] = value.Plot.Value, ["otherVals"] = OtherValsTable}
	end
	CurrentBuildStore = HTTPService:JSONEncode(CurrentBuildStore)
	--print(CurrentBuildStore)
	local succes, err = pcall(function()
		DataStore:SetAsync(plr.UserId, CurrentBuildStore)
	end)
	
	--// Save Inventory
	local DataStore = DSS:GetDataStore("PlayerData", "InvStore")
	
	local SaveDictionary = {}
	local SubSaveDictionary = {}
	local BuildInv = plr.BuildInv
	
	for _, value in pairs(BuildInv:GetChildren()) do
		--print(value)
		SubSaveDictionary = {}
		for _, value2 in pairs(value:GetChildren()) do
			--print(value2)
			SubSaveDictionary[value2.Name] = value2.Value
		end
		SaveDictionary[value.Name] = SubSaveDictionary
	end
	
--	print(HTTPService:JSONEncode(SaveDictionary))
	
	SaveDictionary = HTTPService:JSONEncode(SaveDictionary)
	
	local succes, err = pcall(function()
		DataStore:SetAsync(plr.UserId, SaveDictionary)
	end)
end)

wait(5)

--game.ReplicatedStorage.ReportErrorToLocal:FireAllClients(Color3.fromRGB(0, 34, 255), "Fatal Test Error Warning", "")

game.ReplicatedStorage.LoadBackpack.OnServerInvoke = function(plr)
	wait(math.random(1,3))
	return true
end

--//Handle the Build Event

game.ReplicatedStorage.PlaceObject.OnServerEvent:Connect(function(sender, ObjectName, PositionName)
--	print(ObjectName)
--	print(PositionName)
	local Object = nil
	local Grid = nil
	local InvObj = nil
	if sender.BuildInv:FindFirstChild(ObjectName) then
		InvObj = sender.BuildInv:FindFirstChild(ObjectName)
	else
		warn(sender.Name .. " - THREAT DETECTION")
		game.ReplicatedStorage.ReportErrorToLocal:FireAllClients(Color3.fromRGB(255, 0, 4), "Threat Detection", "The Server has detected an threat. Informations:<br /><b>Exploiter: </b>" .. sender.Name .. "<br /><b>Detected Threat:</b> Unallowed Inventory Items.<br /> <b>Measures: </b>Exploiter has been banned and resetted.")
		wait(5)
		sender:Kick("\n\nYou have been banned from this game.\n\nReason: Trying to cheat items.\nLenght: PERMANENT\n\n\nIf you wish to appeal, please contact our support via. our discord server.\n\n")
		workspace.Plot.PruchasedObj:ClearAllChildren()
	end
	local Amount = InvObj.Amount
	
	local succes, err = pcall(function()
		Object = game.ReplicatedStorage.AvaibleObjects:FindFirstChild(ObjectName):Clone()
		Grid = workspace.Plot.gridsys.Grids:FindFirstChild(PositionName)
	end)
	if succes then
		Object.Parent = workspace.Plot.PruchasedObj
		local TI = TweenInfo.new(0.01, Enum.EasingStyle.Linear)
		local RootMovePart = Object.Root
		local goal = {CFrame = workspace.Plot.gridsys.Grids:WaitForChild(PositionName).CFrame}

		local MoveTween = TweenService:Create(RootMovePart, TI , goal)
		
		workspace.Plot.gridsys.Grids:WaitForChild(PositionName).GridUsed.Value = true
		
		MoveTween:Play()
		
		for i = 0, Object.SizeX.Value do
			for u = 0, Object.SizeZ.Value do
				workspace.Plot.gridsys.EnableGrid.Value = false
				wait(1)
				workspace.Plot.gridsys.EnableGrid.Value = true
				workspace.Plot.gridsys.Grids:WaitForChild(Object.PosX.Value + u.."-" .. Object.PosZ.Value .. "-" .. Object.Plot.Value).GridUsed.Value = true
			end
			workspace.Plot.gridsys.Grids:WaitForChild(Object.PosX.Value .."-" .. Object.PosZ.Value + i .. "-" .. Object.Plot.Value).GridUsed.Value = true
			workspace.Plot.gridsys.EnableGrid.Value = false
			wait(1)
			workspace.Plot.gridsys.EnableGrid.Value = true
		end
		
		local x = string.split(PositionName, "-")[1]
		local z = string.split(PositionName, "-")[2]
		local plot = string.split(PositionName, "-")[3]
		
		Object.PosX.Value = x
		Object.PosZ.Value = z
		Object.Plot.Value = plot
		
		
		
		if Amount.Value == 1 then
			InvObj:Destroy()
		else
			Amount.Value = Amount.Value - 1
		end
	else
		warn(err)
	end
end)