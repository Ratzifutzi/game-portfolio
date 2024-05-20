local DataStoreService = game:GetService("DataStoreService")

local event = {}

local DonationDataStore = DataStoreService:GetOrderedDataStore("Donations")

event["listening"] = game.ReplicatedStorage.Functions.CtS.RequestDonationLeaderboard

event["cached"] = {}
event["lastUpdate"] = DateTime.now().UnixTimestamp

event["function"] = function (player:Player)
	local success
	local currentData

	repeat
		success, currentData = xpcall(function()
			return DonationDataStore:GetSortedAsync(false, 100):GetCurrentPage()
		end, function()
			warn("Error getting current Donation Data. Retrying in 5 seconds")
			task.wait(5)
		end)
	until success

	event.cached = currentData

	return event.cached
end

return event
