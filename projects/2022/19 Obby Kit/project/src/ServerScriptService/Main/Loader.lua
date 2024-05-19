local module = {}

function module.init()
	for k, module:ModuleScript in pairs(script.Parent.RBXScriptSignals:GetChildren()) do
		local requiredModule = require(module)
		requiredModule.signal:Connect(requiredModule.event)
	end
end

return module
