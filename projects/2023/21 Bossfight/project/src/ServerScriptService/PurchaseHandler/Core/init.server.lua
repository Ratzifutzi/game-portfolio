MarketplaceService = game:GetService("MarketplaceService")
Players = game:GetService("Players")
ReplicatedStorage = game:GetService("ReplicatedStorage")

Root = script.Parent

assert(Root.Gamepasses, "Gamepasses folder not found or not on the correct parent")
assert(Root.Gamepasses, "DevProduct folder not found or not on the correct parent")

for _, v in pairs( script.ReplicatedStorage:GetChildren() ) do
	if ReplicatedStorage:FindFirstChild( v.Name ) then
		warn("CRITICAL WARNING\nHyper Payments tried to move instances into the Replicated storage but the instance name was occupied. Make sure to remove any instance called", v.Name, "from the replicated storage to ensure the funtionality of this module.")
	end
	v.Parent = ReplicatedStorage
end

DevProductRoutes = Root.DevProducts
GamepassesRoutes = Root.Gamepasses

DevProductHandler = require( script.DevProductHandler )
GamepassHandler = require( script.GamepassHandler )

MarketplaceService.PromptGamePassPurchaseFinished:Connect( GamepassHandler.PromptGamePassPurchaseFinished )
Players.PlayerAdded:Connect( GamepassHandler.playerAdded )

MarketplaceService.ProcessReceipt = DevProductHandler.ProcessReceipt