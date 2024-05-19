-- If you do not know how to use this or the GUI, check out my YouTube video tutorial on this. 
-- Replace the 0's with your ID's 
-- Delete what you dont use, besides the first part of the function

local MarketplaceService = game:GetService("MarketplaceService")
local DataStoreService = game:GetService("DataStoreService")
local DataStore = DataStoreService:GetDataStore("PlayerData", "Pruchases")

imgDevProductsDictionary = {
	["DevConsole"] = false
}

game.Players.PlayerAdded:Connect(function(plr)
	local DevCon = Instance.new("BoolValue")
	DevCon.Parent = plr
	DevCon.Name = "DevCon"
	print(plr.UserId)
	local success, DevProductsDictionary = pcall(function()
		return DataStore:GetAsync(plr.UserId)
	end)
	if success then
		if DevProductsDictionary == nil then
			DevProductsDictionary = imgDevProductsDictionary
		else
			DevProductsDictionary = DevProductsDictionary
		end
	else
		workspace.HTPH.PruchaseResponse:FireClient(plr, "There was an error receiving your data. Please contact our support.", "DANGER")
	end
	
	DevCon.Value = DevProductsDictionary["DevConsole"]
end)

function getPlayerFromId(id)
	for i,v in pairs(game.Players:GetChildren()) do
		if v.userId == id then
			return v
		end
	end
	return nil
end


MarketplaceService.ProcessReceipt = function(receiptInfo)
	local productId = receiptInfo.ProductId
	local playerId = receiptInfo.PlayerId
	local player = getPlayerFromId(playerId)
	local productName 
	
	-------------------------------------------------------------------
	
	if productId == 1205474685 then --Premium Dev Console Prompt
		print(player.Name .. " prompted " .. productId)
		local success, DevProductsDictionary = pcall(function()
			return DataStore:GetAsync(player.UserId)
		end)
		if success then
			if DevProductsDictionary == nil then
				DevProductsDictionary = imgDevProductsDictionary
			end

			DevProductsDictionary["DevConsole"] = true
			
			local success, DevProductsDictionary = pcall(function()
				return DataStore:SetAsync(player.UserId, DevProductsDictionary)
			end)
			player.DevCon.Value = true
			workspace.HTPH.PruchaseResponse:FireClient(player, "Thank you for pruchasing the Developer Console!(40% Off)", "Pruchase Complete")
		else
			warn("Datastore Error. Handel Error Please")
			workspace.HTPH.PruchaseResponse:FireClient(player, "There was an error handling your pruchase. Please contact our support.", "DANGER")
			player.DevCon.Value = true
		end
		
	else if productId == 1205474095 then --Normal Dev Console Prompt
			print(player.Name .. " prompted " .. productId)
			local success, DevProductsDictionary = pcall(function()
				return DataStore:GetAsync(player.UserId)
			end)
			if success then
				if DevProductsDictionary == nil then
					DevProductsDictionary = imgDevProductsDictionary
				end

				DevProductsDictionary["DevConsole"] = true

				local success, DevProductsDictionary = pcall(function()
					return DataStore:SetAsync(player.UserId, DevProductsDictionary)
				end)
				player.DevCon.Value = true
				workspace.HTPH.PruchaseResponse:FireClient(player, "Thank you for pruchasing the Developer Console!", "Pruchase Complete")
			else
				warn("Datastore Error. Handel Error Please")
				workspace.HTPH.PruchaseResponse:FireClient(player, "There was an error handling your pruchase. Please contact our support.", "DANGER")
				player.DevCon.Value = true
			end
		end
	
		-------------------------------------------------------------------
	end
	return Enum.ProductPurchaseDecision.PurchaseGranted
end