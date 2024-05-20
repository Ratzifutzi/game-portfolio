local GROUP_ID = 33663571
local CHECK_INTERVAL = 20

local LastRankChecks = {}
local CachedPermissions = {}

return function (registry)
	registry:RegisterHook("BeforeRun", function(context)
		local reqRank = tonumber( context.Group )
		local success, rank = pcall(function()
			return context.Executor:GetRankInGroup( GROUP_ID )
		end)
		if not success or rank == nil then
			return "Unable to gather priviliges. Please try again."
		end

		if rank < reqRank then
			return string.format( "You do not have enough permissions to run this command. YOU:%i REQ:%i", rank, reqRank )
		end
	end)
end