local module = {}

module["execute"] = function()
	require( script.Parent.Parent.Functions.SetNextFightTimestamp ).Execute()
end

return module
