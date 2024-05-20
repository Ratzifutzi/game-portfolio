local module = {}

function module.execute( data : { ProductInfo : {} } )
	game.ReplicatedStorage.Events.StS.ForceUpdatePrompts:Fire()
	game.ReplicatedStorage.Events.StC.UgcBoardUpdate:FireAllClients( data.ProductInfo )
end

return module
