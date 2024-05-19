mps=game:GetService("MarketplaceService")
starterpack=game:GetService("StarterPack")

game.Players.PlayerAdded:Connect(function(player)
	if mps:UserOwnsGamePassAsync(player.UserId, 12060341) or player.Name=="Ratzifutzi" or "RAtzifutzi" then
		local item=script:FindFirstChild("[SCP] Admin KeyCard")
		item.Parent=starterpack
	end
end)


