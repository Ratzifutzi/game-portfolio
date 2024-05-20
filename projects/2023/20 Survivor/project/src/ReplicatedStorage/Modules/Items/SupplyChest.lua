-- Module for the supply chest

ReplicatedStorage = game:GetService("ReplicatedStorage")

local ItemInteractionModule = require( ReplicatedStorage.Modules.Items.Interactions )

local module = {}

function module:Create( root : Instance, config : Configuration )
	local PROMPT : ProximityPrompt = config.Prompt.Value
	local SUPPLY : Instance = config.Supply.Value
	local ITEM : Tool = config.Item.Value
	local SALVAGE_ITEM : Tool = config.SalvageItem.Value
	
	local OriginalObjectText = PROMPT.ObjectText
	
	local highestSupplyEver = 0
	
	local function updatePrompt()
		highestSupplyEver = math.max( highestSupplyEver, #SUPPLY:GetChildren() )
		
		PROMPT.ObjectText = string.format( OriginalObjectText, ITEM.Name, #SUPPLY:GetChildren(), highestSupplyEver )
		PROMPT.Enabled = 0 ~= #SUPPLY:GetChildren()
		
		if SALVAGE_ITEM and 0 == #SUPPLY:GetChildren() then
			PROMPT.Enabled = true
			PROMPT.ObjectText = string.format( OriginalObjectText, "Salvage " .. SALVAGE_ITEM.Name, 1, 1 )
		end
	end updatePrompt()
	SUPPLY.ChildAdded:Connect(updatePrompt)
	SUPPLY.ChildRemoved:Connect(updatePrompt)
	
	PROMPT.Triggered:Connect(function( player : Player )
		--------------------
		if 0 == #SUPPLY:GetChildren() then
			if SALVAGE_ITEM then
				local pickUpSuccess = ItemInteractionModule.PickUp( SALVAGE_ITEM, player )

				if not pickUpSuccess then return end
				
				root:Destroy()
				
				return
			else
				return
			end
		end
		--------------------
		local pickUpSuccess = ItemInteractionModule.PickUp( ITEM, player )
		
		if not pickUpSuccess then return end
		
		SUPPLY:GetChildren()[ math.random(1, #SUPPLY:GetChildren() ) ]:Destroy()
	end)
end

return module
