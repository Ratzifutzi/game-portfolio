ReplicatedStorage = game:GetService("ReplicatedStorage")

local module = {}

function module.execute( data : { ProductInfo : {} } )
	ReplicatedStorage.Events.StC.DonationBoardUpdate:FireAllClients()
end

return module
