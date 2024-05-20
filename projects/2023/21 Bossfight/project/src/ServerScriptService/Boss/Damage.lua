local module = {}

module.HitsAllowed = 2.9

function module.DealDamage()
	local patternRoot = workspace.Interactive.BossFight.Patterns
	
	local function changeCollision( collision : boolean )
		for k, v:BasePart in pairs( patternRoot:GetDescendants() ) do
			if not v:IsA("BasePart") then continue end

			v.CanCollide = collision
		end
	end

	changeCollision(true)
	local playersDamaged = {}
	for k, player:Player in pairs( game.Players:GetChildren() ) do
		if not player.Character then continue end
		if not player.UserData.InBossFight.Value then continue end
		
		for k, part : BasePart in pairs( player.Character:GetDescendants() ) do
			if not part:IsA("BasePart") then continue end
			if part:IsA("Accessory") then continue end

			for k, touch in pairs( part:GetTouchingParts() ) do
				if not patternRoot:FindFirstChild( touch.Name, true ) then continue end
				if table.find( playersDamaged, touch.Parent ) then continue end

				table.insert(playersDamaged, touch.Parent)
				player.Character.Humanoid:TakeDamage(100 / module.HitsAllowed)
			end
		end
	end
	changeCollision(false)
end

return module
