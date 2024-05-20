MessagingService = game:GetService("MessagingService")
MarketplaceService = game:GetService("MarketplaceService")
ReplicatedStorage = game:GetService("ReplicatedStorage")

MessagingService:SubscribeAsync( "BroadcastMessage", function( data : {} )
	local message = data["Data"]
	
	ReplicatedStorage.Events.StC.ChatMessage:FireAllClients( message["Message"] )
	
	if message["Action"] then
		require( script[ message["Action"] ] ).execute( message )
	end
end)