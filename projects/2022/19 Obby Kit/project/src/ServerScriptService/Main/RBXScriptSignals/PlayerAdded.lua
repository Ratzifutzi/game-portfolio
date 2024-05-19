ObbyModule = require(script.Parent.Parent.Modules.ObbySystem)
RecorderModule = require(script.Parent.Parent.Modules.Recorder)
LeaderstatsModule = require(script.Parent.Parent.Modules.LeaderstatsController)

DataStoreService = game:GetService("DataStoreService")
PlayerDataStore = DataStoreService:GetDataStore("data")

function CreateInstance (instance:Instance, parent:Instance, name:string, propeties:any)
	instance.Name = name
	instance.Parent = parent

	for k, v in pairs(propeties) do
		instance[k] = v
	end

	return instance
end



local module = {}

module.signal = game.Players.PlayerAdded

function module.event(player:Player)
	local _dataFolder = CreateInstance(Instance.new("Folder"), player, "Data", {})
	
	local _coins = CreateInstance(Instance.new("NumberValue"), _dataFolder, "Coins", {})
	local _stage = CreateInstance(Instance.new("NumberValue"), _dataFolder, "Stage", {})
	local _timesBeaten = CreateInstance(Instance.new("NumberValue"), _dataFolder, "TimesBeaten", {})
	local _inObby = CreateInstance(Instance.new("NumberValue"), _dataFolder, "InObby", {})
	local _deathsThisStage = CreateInstance(Instance.new("NumberValue"), _dataFolder, "DeathsThisStage", {})
	
	local _timerStart = CreateInstance(Instance.new("StringValue"), _dataFolder, "TimerStarted", {Value = "-1"})
	local _timerEnded = CreateInstance(Instance.new("StringValue"), _dataFolder, "TimerEnded", {Value = "-1"})
	
	--Gather Datastore Data
	--TODO Add Datastore
	local success, savedData = pcall(function()
		return PlayerDataStore:GetAsync( player.UserId )
	end)
	if not success then player:Kick("Failed to fetch data \n\n{B1}") end
	
	if savedData == nil then
		savedData = {}
	end
	
	if success then
		for k, v in pairs(savedData) do
			_dataFolder[k].Value = v
		end
		
		print("Loaded Data!")
	end
	
	LeaderstatsModule.InitLeaderstats(player)
	
	player.CharacterAdded:Connect(function(character:Instance)
		local _checkpoint = workspace.Checkpoints:FindFirstChild(tostring(_stage.Value))
		
		repeat character.HumanoidRootPart.CFrame = CFrame.new( _checkpoint.CFrame * Vector3.new(0, 3, 0) ) task.wait() until character.HumanoidRootPart.Position.X == _checkpoint.Position.X
		
		character.HumanoidRootPart.Rotation = Vector3.new(0, _checkpoint.Rotation.Y, 0)
		
		local humanoid:Humanoid = character.Humanoid
		humanoid.Running:Connect(function(speed)
			if speed == 0 then return nil end
			
			if _timerStart.Value ~= "-1" then return nil end
			
			_timerStart.Value = tick()
			repeat character.HumanoidRootPart.CFrame = CFrame.new( _checkpoint.CFrame * Vector3.new(0, 3, 0) ) task.wait() until character.HumanoidRootPart.Position.X == _checkpoint.Position.X

			character.HumanoidRootPart.Rotation = Vector3.new(0, _checkpoint.Rotation.Y, 0)
		end)
		
		--RecorderModule.record(character)
	end)
	
	player.CharacterRemoving:Connect(function(character:Instance)
		_deathsThisStage.Value += 1
	end)
end

return module
