local module = {}

module.productId = require( game.ReplicatedStorage.DevProducts ).Products.Revive

module.purchased = function(receiptInfo)
	local player : Player = game.Players:GetPlayerByUserId( receiptInfo.PlayerId )
	
	game.ReplicatedStorage.Events.StS.RevivePlayer:Fire( player )
	
	local connection connection = game.MarketplaceService.PromptProductPurchaseFinished:Connect(function( userId )
		if userId ~= player.UserId then return nil end
		
		game.ReplicatedStorage.Events.StC.DialogBox:FireClient( player, {
			{
				["Text"] = "You've been revived.",
				["Duration"] = 3
			},
			{
				["Text"] = "Your immunity doesn't last long, play safe!",
				["Duration"] = 3
			}
		} )
		connection:Disconnect()
	end)
	
	return Enum.ProductPurchaseDecision.PurchaseGranted
end

module.test = function(receiptInfo)
	-- No Test
	return true
end

return module
