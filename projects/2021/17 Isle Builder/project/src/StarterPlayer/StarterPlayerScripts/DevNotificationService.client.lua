local CoreGui = game:GetService("StarterGui")

game.ReplicatedStorage.SendMessageToClient.OnClientEvent:Connect(function(Ttl, Txt, Dur)
	CoreGui:SetCore("SendNotification", {
		Title = Ttl;
		Text = Txt;
		Duration = Dur;
		--Callback here
		Button1 = "Dismiss";
	})
end)