MessagingService = game:GetService("MessagingService")
MarketplaceService = game:GetService("MarketplaceService")
ReplicatedStorage = game:GetService("ReplicatedStorage")

GetUserNametagColor = require( ReplicatedStorage.Modules.GetUserNametagColor )
ItemNameColors = require( ReplicatedStorage.Modules.ItemNameColors )

local event = {}

event["listening"] = MarketplaceService.PromptPurchaseFinished -- Function here

event["function"] = function (player:Player, assetId:number, isPurchased:boolean)
	if not isPurchased then return end

	local productInfo = MarketplaceService:GetProductInfo( assetId, Enum.InfoType.Asset )

	local playername = player.Name
	if player.MembershipType == Enum.MembershipType.Premium then
		playername = string.format( "\u{E001} %s", player.Name )
	end

	local nameTagBrickColor = GetUserNametagColor( player.Name )
	local nameTagRgbColor = string.format("%d,%d,%d", nameTagBrickColor.R * 255, nameTagBrickColor.G * 255, nameTagBrickColor.B * 255)

	local itemColor = "255,255,255"
	if ItemNameColors[ assetId ] then
		local itemColorPercentage = ItemNameColors[assetId]
		itemColor = string.format("%d,%d,%d", itemColorPercentage.R * 255, itemColorPercentage.G * 255, itemColorPercentage.B * 255)
	end

	local message = string.format( "[Global] <font color=\"rgb(%s)\"><b>%s</b></font> just received the <font color=\"rgb(%s)\"><b>%s</b></font> into their inventory!", 
		nameTagRgbColor,
		playername,
		itemColor,
		productInfo.Name
	)

	MessagingService:PublishAsync("BroadcastMessage", {
		["Message"] = message,
		["Action"] = "UgcPurchase",
		["ProductInfo"] = {
			["Player"] = player.Name,
			["Name"] = productInfo.Name,
			["UserId"] = player.UserId
		}
	})
end

return event
