MarketplaceService = game:GetService("MarketplaceService")
RunService = game:GetService("RunService")
ReplicatedStorage = game:GetService("ReplicatedStorage")

Hooks = ReplicatedStorage:WaitForChild("HyperPaymentHooks")
Gamepasses = script.Parent.Parent.Gamepasses

local module = {}

module.PromptGamePassPurchaseFinished = function(player:Player, gamePassId:number, wasPurchased:boolean)
	if not player then return end
	if not wasPurchased then
		Hooks["PaymentCanceled"]:FireClient( player )
		return
	end
	
	local receiptInfo = {
		player = player,
		userId = player.UserId,
		gamePassId = gamePassId,
		wasPurchased = wasPurchased
	}
	
	-------------------------------------------------------
	-- PLACE CODE THAT SHOULD RUN ON EVERY PURCHASE HERE --
	
	
	
	-- PLACE CODE THAT SHOULD RUN ON EVERY PURCHASE HERE --
	-------------------------------------------------------
	
	for _, gamepassModule in pairs( Gamepasses:GetChildren() ) do
		local gamepass = require( gamepassModule )
		
		if gamepass.gamepassId ~= gamePassId then continue end
		
		gamepass.purchased(receiptInfo)
		local testResult = gamepass.test(receiptInfo)
		
		if testResult ~= true then
			warn("Test Failed\nPlayer Reward failed. Test Error:", testResult)
			Hooks["PaymentTestFailed"]:FireClient( player )
			
			return
		end
		
		print(player, "purchased", gamePassId, "and product reward was successful")
		Hooks["PaymentSuccessful"]:FireClient( player )
		
		return true
		
	end
	
	warn("Config Error\nNo Gamepass Controller found for gamepass", gamePassId)
end

module.checkForPlayerGamepasses = function( player : Player )
	for _, gamepassModule in pairs( Gamepasses:GetChildren() ) do
		if gamepassModule.Name == "Example" then continue end
		
		local gamepass = require( gamepassModule ) 
		
		if not MarketplaceService:UserOwnsGamePassAsync( player.UserId, gamepass.gamepassId ) then continue end
		
		local receiptInfo = {
			player = player,
			userId = player.UserId,
			gamePassId = gamepass.gamepassId,
			wasPurchased = true
		}
		
		local firstTestResult = gamepass.test(receiptInfo)
		gamepass.purchased(receiptInfo)
		local secondTestResult = gamepass.test(receiptInfo)

		if secondTestResult ~= true then
			warn("Test Failed\nPlayer Reward failed. Test Error:", secondTestResult)

			return
		end
		
		if firstTestResult ~= true and secondTestResult == true then
			--Hooks["PaymentSuccessful"]:FireClient( player )
		end
	end
end

module.playerAdded = function( player : Player )
	local lastCheck = 0
	
	RunService.Heartbeat:Connect(function()
		if tick() - lastCheck < 30 then return end
		lastCheck = tick()
		
		module.checkForPlayerGamepasses( player )
	end)
end

return module
