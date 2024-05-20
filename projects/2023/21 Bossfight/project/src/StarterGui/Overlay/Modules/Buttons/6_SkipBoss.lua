local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")

local ROOT = script.Parent.Parent.Parent

local module = {}

function module.execute()
	MarketplaceService:PromptProductPurchase( Players.LocalPlayer, 1734855230 )
end

return module
