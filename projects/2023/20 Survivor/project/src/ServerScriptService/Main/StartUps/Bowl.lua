-- Initiates the Fire Bowl

local module = {}

module["execute"] = function()
	local config = require( game.ReplicatedStorage.Configuration )
	
	workspace.Values.Bowl.Health.Value = config.FireBowl.MaximalHealth
	workspace.Values.Bowl.FuelTill.Value = DateTime.now().UnixTimestamp + config.FireBowl.MaximalBurnTime
end

return module
