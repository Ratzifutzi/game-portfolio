
script.Parent.Transparency = 1

script.Parent.Touched:Connect(function(hit)
	if game.Players:GetPlayerFromCharacter(hit.Parent) then
		local player = game.Players:GetPlayerFromCharacter(hit.Parent)
		player:Kick("ANTI-CHEAT KICK CODE: #221")
	end
	
end)