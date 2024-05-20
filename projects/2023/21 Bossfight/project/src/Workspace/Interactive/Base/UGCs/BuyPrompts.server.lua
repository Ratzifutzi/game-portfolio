MarketplaceService = game:GetService("MarketplaceService")

for k, folder : Folder in pairs( script.Parent:GetChildren() ) do
	if not folder:IsA("Folder") then continue end

	local buyPrompt: ProximityPrompt = folder["Buy"]["ProximityPrompt"]
	local assetId: NumberValue = folder["AssetId"]
	
	buyPrompt.Triggered:Connect(function()
		MarketplaceService:PromptPurchase( game.Players.LocalPlayer, assetId.Value )
	end)
end
