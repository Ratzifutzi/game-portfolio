ReplicatedStorage = game.ReplicatedStorage

ReplicatedStorage.Events.ServerToClient.PlayVisuals.OnClientEvent:Connect(function( name : string, args : {} )
	local module = script.Parent.Modules:FindFirstChild( name, true )
	
	require( module ):Play( args )
end)