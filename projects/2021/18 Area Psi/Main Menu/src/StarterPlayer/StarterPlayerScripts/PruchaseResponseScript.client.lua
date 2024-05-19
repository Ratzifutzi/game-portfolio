local StarterGui = game:GetService("StarterGui")
local RemoteEvent = workspace.HTPH.PruchaseResponse

RemoteEvent.OnClientEvent:Connect(function(msg, title)
	StarterGui:SetCore("SendNotification", {
		Title = title;
		Text = msg;
		Duration = 20
	})
end)

