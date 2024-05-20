ReplicatedStorage = game:GetService("ReplicatedStorage")
Players = game:GetService("Players")

ReplicatedStorage.Events.StC.UgcBoardUpdate.OnClientEvent:Connect(function( productInfo: { Player: string, Name: string, UserId: number } )
	local clone = script.UgcMother:Clone()
	
	clone.PlayerName.Text = productInfo.Player
	clone.ItemName.Text = string.format( clone.ItemName.Text, productInfo.Name )
	clone.Name = 99999999999999 - (#script.Parent:GetChildren())

	clone.Parent = script.Parent
	
	spawn(function()
		clone.PlayerIcon.Image = ""
		
		local imageId, ready = Players:GetUserThumbnailAsync( productInfo.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size60x60 )
		clone.PlayerIcon.Image = imageId
	end)
end)