TextChatService = game:GetService("TextChatService")
ReplicatedStorage = game:GetService("ReplicatedStorage")

ReplicatedStorage.Events.StC.ChatMessage.OnClientEvent:Connect(function( message )
	TextChatService.TextChannels.RBXGeneral:DisplaySystemMessage(message)
end)