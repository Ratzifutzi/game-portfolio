local module = {}

function module.Execute()
	workspace.Values.NextFightAt.Value = DateTime.now().UnixTimestamp + 60
end

return module
