-- Defines the ending parameters

local module = {}

module["execute"] = function()
	local config = require( game.ReplicatedStorage.Configuration )
	
	local defeated = false
		
	repeat
		if not defeated then
			defeated = workspace.Values.Bowl.Health.Value <= 0
		end
		
		if not defeated then
			defeated = workspace.Values.Bowl.FuelTill.Value < DateTime.now().UnixTimestamp
		end
		
		task.wait()
	until defeated
	
	-- Ending Code below this line
	warn("Defeated")
end

return module
