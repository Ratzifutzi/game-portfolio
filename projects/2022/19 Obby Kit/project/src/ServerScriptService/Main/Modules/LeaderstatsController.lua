function CreateInstance (instance:Instance, parent:Instance, name:string, propeties:any)
	instance.Name = name
	instance.Parent = parent

	for k, v in pairs(propeties) do
		instance[k] = v
	end

	return instance
end

local module = {}

function module.InitLeaderstats (player:Player)
	local _leaderstats = CreateInstance(Instance.new("Folder"), player, "leaderstats", {})
	
	local _stage:NumberValue = CreateInstance(Instance.new("NumberValue"), _leaderstats, "Stage", {})
	local _timesBeaten:NumberValue = CreateInstance(Instance.new("NumberValue"), _leaderstats, "Wins", {})
	
	local function updateValues()
		_stage.Value = player["Data"]["Stage"].Value
		_timesBeaten.Value = player["Data"]["TimesBeaten"].Value
	end
	
	player["Data"]["Stage"].Changed:Connect(updateValues)
	player["Data"]["TimesBeaten"].Changed:Connect(updateValues)
end


return module