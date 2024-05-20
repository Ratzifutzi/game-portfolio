-- Handling multiple Interaction
-- TODO Sub Modules

local module = {}

function module.GetEquipLoad( player : Player )
	local load = 0
	for k, item : Tool in pairs( player.Backpack:GetChildren() ) do
		if not item:GetAttribute("Weight") then
			warn("Item", item.Name, "has no weight attribute.")
			continue
		end
		
		load += item:GetAttribute("Weight")
	end
	
	return load
end

function module.PickUp( item : Tool, player : Player )
	if game:GetService("RunService"):IsClient() then
		warn("Client can't pick up items")
		return false
	end
	
	--------------------
	if module.GetEquipLoad(player) + item:GetAttribute("Weight") > player["UserData"]["MaxEquipLoad"].Value then
		return false
	end
	--------------------
	
	local c = item:Clone()
	c.Parent =  player.Backpack
	return true
end

return module
