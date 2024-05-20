local module = {}

function module.init ( arguments )
	for k, connection in pairs(script.RBXScriptSignals:GetChildren()) do
		local mod = require(connection)
		mod.listening:Connect(mod.event)
	end

	for k, connection in pairs(script.BindableAndRemoteFunctions:GetDescendants()) do
		if not connection:IsA("ModuleScript") then continue end

		local mod = require(connection)
		if not mod["listening"] then warn(connection.Name, "connection misses an function.") continue end

		mod["listening"].OnServerInvoke = mod["function"]
	end

	for k, connection in pairs(script.BindableAndRemoteEvents:GetDescendants()) do
		if not connection:IsA("ModuleScript") then continue end

		local mod = require(connection)
		if not mod["listening"] then warn(connection.Name, "connection misses an event.") continue end

		mod["listening"]:Connect(mod["function"])
	end

	for k, startUp in pairs( script.StartUps:GetDescendants() ) do
		task.spawn( require(startUp).execute )
	end
end

return module
