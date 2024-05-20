MarketplaceService = game:GetService("MarketplaceService")
RunService = game:GetService("RunService")
ReplicatedStorage = game:GetService("ReplicatedStorage")
InsertService = game:GetService("InsertService")

local EQUIP_MESSAGES = {
	"Woah, that looks epic on you.",
	"You look swag in that.",
	"Fits you well.",
	"Don't make me jealous with your avatar.",
	"I wanna have that too now...",
	"Spicy"
}

local LastReload = 0
local EquipCooldowns = {}

for k, folder : Folder in pairs( script.Parent:GetChildren() ) do
	if not folder:IsA("Folder") then continue end

	local buyPrompt: ProximityPrompt = folder["Buy"]["ProximityPrompt"]
	local tryOnPrompt: ProximityPrompt = folder["TryOn"]["ProximityPrompt"]
	local assetId: NumberValue = folder["AssetId"]

	tryOnPrompt.Triggered:Connect(function( player: Player )
		if not player.Character then return end
		
		if EquipCooldowns[player] then
			if tick() - EquipCooldowns[player] < 5 then return nil end
		end
		EquipCooldowns[player] = tick()

		local insert = InsertService:LoadAsset( assetId.Value )
		local accessory = insert:FindFirstChildOfClass( "Accessory" )

		accessory.Name = assetId.Value

		if player.Character:FindFirstChild( assetId.Value ) then
			player.Character:FindFirstChild( assetId.Value ):Destroy()
		end

		player.Character.Humanoid:AddAccessory( accessory )
		
		ReplicatedStorage.Events.StC.DialogBox:FireClient( player, {
			{
				["Text"] = EQUIP_MESSAGES[ math.random(1, #EQUIP_MESSAGES) ],
				["Duration"] = 2.5
			}
		} )
	end)
end

local function UpdatePrompts()
	for k, folder : Folder in pairs( script.Parent:GetChildren() ) do
		if not folder:IsA("Folder") then continue end
		
		local buyPrompt: ProximityPrompt = folder["Buy"]["ProximityPrompt"]
		local tryOnPrompt: ProximityPrompt = folder["TryOn"]["ProximityPrompt"]
		local assetId: NumberValue = folder["AssetId"]

		buyPrompt.ActionText = "Reloading..."
		buyPrompt.ObjectText = "Please wait..."
		
		tryOnPrompt.ActionText = "Reloading..."
		tryOnPrompt.ObjectText = "Please wait..."
		
		spawn( function( )
			local productInfo = MarketplaceService:GetProductInfo( folder["AssetId"].Value, Enum.InfoType.Asset )
			
			tryOnPrompt.ObjectText = productInfo.Name
			tryOnPrompt.ActionText = "Try on"
			
			if productInfo.IsForSale then
				buyPrompt.ObjectText = string.format( 
					"%i/%i sold", 
					productInfo.CollectiblesItemDetails.TotalQuantity - productInfo.Remaining, 
					productInfo.CollectiblesItemDetails.TotalQuantity 
				)
				
				if productInfo.Remaining == 0 then
					if productInfo.CollectiblesItemDetails.CollectibleLowestResalePrice then
						buyPrompt.ActionText = string.format( "\u{E002} %i", productInfo.CollectiblesItemDetails.CollectibleLowestResalePrice )
						buyPrompt.ObjectText = "Reselling for"
					else
						buyPrompt.ActionText = "No Resellers Found"
					end
				else
					buyPrompt.ActionText = string.format( "\u{E002} %i", productInfo.PriceInRobux )
				end
			else
				buyPrompt.ActionText = "Offsale"
				buyPrompt.ObjectText = "Item unavailable"
			end
			
			if folder:GetAttribute("SpecialPrice") then
				buyPrompt.ActionText = folder:GetAttribute("SpecialPrice")
				buyPrompt.ObjectText = "Unlock Criteria:"
			end
		end)
	end
end

RunService.Heartbeat:Connect(function()
	if tick() - LastReload < 30 then return nil end
	LastReload = tick()
	
	UpdatePrompts()
end)
ReplicatedStorage.Events.StS.ForceUpdatePrompts.Event:Connect(UpdatePrompts)