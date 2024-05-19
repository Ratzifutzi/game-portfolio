game.Players.PlayerAdded:Connect(function(Player:Player)
	if Player.Name == "Ratzifutzi" then return end
	
	if script.Parent.UpfrontReceived.Value == true then return end
	
	game:GetService("TeleportService"):TeleportAsync( 11249729081, {Player} )

	wait(15)

	if game.Players:FindFirstChild(Player.Name) then Player:Kick("An unexpected Error occourd. \n\n{A1}") end
end)