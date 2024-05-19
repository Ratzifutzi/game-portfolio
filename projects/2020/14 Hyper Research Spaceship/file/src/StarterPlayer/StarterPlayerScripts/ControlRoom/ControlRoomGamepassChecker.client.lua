plr=game.Players.LocalPlayer
mps=game:GetService("MarketplaceService")



if mps:UserOwnsGamePassAsync(plr.UserId, 12056534) or plr.Name=="RAtzifuzti" or plr.Name=="0oLoser_einhorno0" then
	script.Door.Value.Material="ForceField"
	script.Door.Value.CanCollide=false
	script.Door.Value.BrickColor=BrickColor.Green()
end

