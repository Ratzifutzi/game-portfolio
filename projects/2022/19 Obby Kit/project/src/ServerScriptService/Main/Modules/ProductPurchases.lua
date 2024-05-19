ObbyModule = require(script.Parent.ObbySystem)

local purchases = {}

purchases["1324870520"] = function (receiptInfo) --Skip
	local player = game.Players:GetPlayerByUserId(receiptInfo.PlayerId)
	
	local currentStage = player.Data.Stage.Value
	
	ObbyModule.SpawnPlayer(player, currentStage + 1, 0)
end

purchases.handle = function (receiptInfo)
	purchases[tostring(receiptInfo.ProductId)](receiptInfo)
end

return purchases
