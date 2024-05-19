MarketplaceService = game:GetService("MarketplaceService")

LoaderModule = require(script.Parent.Loader)
ObbyModule = require(script.Parent.Modules.ObbySystem)
ProductPurchasesModule = require(script.Parent.Modules.ProductPurchases)
MarketplaceModule = require(script.Parent.Modules.CustomMarketPlaceService)

Configuration = require(script.Parent.Configuration)

LoaderModule.init()

MarketplaceService.ProcessReceipt = ProductPurchasesModule.handle

ObbyModule.InitCheckpoints()

game.ReplicatedStorage.Events.fromClient.CheckGamepass.OnServerInvoke = function(sender:Player, gamepassId:number)
	if not tonumber(gamepassId) then
		sender:Kick("Server detected an issue with your client.")
		return false
	end
	
	return MarketplaceModule.CheckGamepass(sender.UserId, gamepassId)
end

game.Players.RespawnTime = Configuration["Players"]["DefaultRespawnTime"]