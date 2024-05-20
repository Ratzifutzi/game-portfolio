local MarketplaceService = game:GetService("MarketplaceService")
local DataStoreService = game:GetService("DataStoreService")
local RoCord = require(script.Parent.RoCord)
local event = {}

local PurchaseTasksStore = DataStoreService:GetDataStore("PurchaseTasks")

MarketplaceService.ProcessReceipt = function( receiptInfo )
	PurchaseTasksStore:RemoveAsync( receiptInfo.PlayerId )
	
	spawn(function()
		local productInfo = MarketplaceService:GetProductInfo(receiptInfo["ProductId"], Enum.InfoType.Product)

		local message = [[User: **-u**
	Product: **-pn**
	Price: **-pr R$**]]

		message = string.gsub(message, "-u", game.Players:GetPlayerByUserId( receiptInfo.PlayerId ).Name)
		message = string.gsub(message, "-pn", productInfo["Name"] )
		message = string.gsub(message, "-pr", productInfo["PriceInRobux"] )

		RoCord.sendSimpleEmbedMessage("1", "Product Licensed", message, "ffffff")
	end)
	
	return Enum.ProductPurchaseDecision.PurchaseGranted
end

return event
