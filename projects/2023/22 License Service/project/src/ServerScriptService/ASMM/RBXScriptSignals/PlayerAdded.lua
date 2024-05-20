local DataStoreService = game:GetService("DataStoreService")
local event = {}

local PurchaseTasksStore = DataStoreService:GetDataStore("PurchaseTasks")

event["listening"] = game.Players.PlayerAdded

event["event"] = function (player)
	local function addIns( parent: Instance, ins: Instance, params: {} )
		for k, v in pairs( params ) do
			ins[k] = v
		end
		
		ins.Parent = parent
		return ins
	end
	
	--------------------------------------------
	
	local activePaymentValue = addIns(player, Instance.new("NumberValue"), {
		["Name"] = "ActivePayment",
		["Value"] = 0
	})
	
	--------------------------------------------
	
	local success, currentTaks = pcall(function()
		return PurchaseTasksStore:GetAsync( player.UserId )
	end)
	
	if success then
		activePaymentValue.Value = currentTaks or 0
	end
	
	--------------------------------------------
	
	workspace.Values.Ready.Value = true
end

return event
