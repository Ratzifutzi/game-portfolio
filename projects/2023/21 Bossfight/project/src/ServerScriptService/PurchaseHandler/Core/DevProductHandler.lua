MarketplaceService = game:GetService("MarketplaceService")
RunService = game:GetService("RunService")
ReplicatedStorage = game:GetService("ReplicatedStorage")
DataStoreService = game:GetService("DataStoreService")
MessagingService = game:GetService("MessagingService")

DonationDataStore = DataStoreService:GetOrderedDataStore( "Donations" )

Hooks = ReplicatedStorage:WaitForChild("HyperPaymentHooks")
DevProducts = script.Parent.Parent.DevProducts

DevProductIdList = require( ReplicatedStorage.DevProducts )
GetUserNametagColor = require( ReplicatedStorage.Modules.GetUserNametagColor )

local module = {}

module.ProcessReceipt = function( receiptInfo )
	local player = game.Players:GetPlayerByUserId( receiptInfo.PlayerId )

	-- Donation Addon
	if table.find( DevProductIdList.Products.Donations, receiptInfo.ProductId ) then
		local success = xpcall( function()
			DonationDataStore:IncrementAsync( player.UserId, 50 )
		end, function( err : string )
			warn( "There was an error updating donation leaderstats.", err )

			return err
		end)

		if success then
			local playername = player.Name
			if player.MembershipType == Enum.MembershipType.Premium then
				playername = string.format( "\u{E001} %s", player.Name )
			end
			
			local nameTagBrickColor = GetUserNametagColor( player.Name )
			local nameTagRgbColor = string.format("%d,%d,%d", nameTagBrickColor.R * 255, nameTagBrickColor.G * 255, nameTagBrickColor.B * 255)
			
			local message = string.format( "[Global] <font color=\"rgb(%s)\"><b>%s</b></font> has just donated <font color=\"rgb(%s)\"><b>\u{E002}%i</b></font>!", 
				nameTagRgbColor,
				playername,
				"255,255,126",
				50 --receiptInfo.CurrencySpent
			)
			
			MessagingService:PublishAsync("BroadcastMessage", {
				["Message"] = message,
				["Action"] = "Donation",
			})

			return Enum.ProductPurchaseDecision.PurchaseGranted
		else
			return Enum.ProductPurchaseDecision.NotProcessedYet
		end
	end

	for _, productModule in pairs(DevProducts:GetDescendants()) do
		if not productModule:IsA("ModuleScript") then continue end

		local product = require(productModule)
		if product.productId ~= receiptInfo.ProductId then continue end

		pcall(function()
			product.purchased(receiptInfo)
		end)
		local testResult = product.test(receiptInfo)
		Hooks["PaymentSuccessful"]:FireClient( player )

		if testResult ~= true then
			warn("Test Failed\nPlayer Reward failed. Test Error:", testResult)
			Hooks["PaymentTestFailed"]:FireClient( player )

			return Enum.ProductPurchaseDecision.NotProcessedYet
		else
			return Enum.ProductPurchaseDecision.PurchaseGranted
		end
	end
end

return module
