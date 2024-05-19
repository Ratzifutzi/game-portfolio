local GamePassId = 12056534 -- GamePass ID here
mps=game:GetService("MarketplaceService")

script.Parent.Touched:connect(function(hit)
	if game.Players:GetPlayerFromCharacter(hit.Parent) then
		local plr = game.Players:GetPlayerFromCharacter(hit.Parent)
		if not mps:UserOwnsGamePassAsync(plr.UserId, GamePassId) or plr.Name=="RAtzifuzti" or plr.Name=="Ratzifutzi" then
			game:GetService("MarketplaceService"):PromptGamePassPurchase(plr, GamePassId)
		end
	end
end)