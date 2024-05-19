DSS = game:GetService("DataStoreService")
DataStore = DSS:GetDataStore("Admin", "Users")
HTTPservice = game:GetService("HttpService")

function UpdateDatas()
	local err, SavedUsers = pcall(function()
		return DSS:GetDataStore("*")
	end)
end