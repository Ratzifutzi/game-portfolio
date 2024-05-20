local module = {}

function module.init ( arguments )
	for k, connection in pairs(script.RBXScriptSignals:GetChildren()) do
		local mod = require(connection)
		mod.listening:Connect(mod.event)
	end
	
	for k, connection in pairs(script.BindableAndRemoteFunctions:GetDescendants()) do
		if not connection:IsA("ModuleScript") then continue end
		
		local mod = require(connection)
		mod["listening"].OnServerInvoke = mod["function"]
	end
	
	for k, startUp in pairs( script.StartUps:GetDescendants() ) do
		task.spawn( require(startUp).execute )
	end
end

return module
