local event = {}

event["listening"] = game.ReplicatedStorage.Functions.ClientToServer.Build.RequestPlacement

event["function"] = function (sender:Player, object:BasePart, targetCFrame:CFrame)
	local config = require( game.ReplicatedStorage.Configuration )
	local clone = object:Clone()
	
	local function changeTransparency ( transparency:number )
		for k, v:BasePart in pairs( clone.Decoration:GetDescendants() ) do
			if not v:IsA("BasePart") then continue end

			v.Transparency = transparency
		end
	end
	
	changeTransparency( 1 )
	clone.Parent = workspace
	repeat
		clone.Hitbox.CFrame = targetCFrame
		clone.Hitbox.Anchored = true
	until clone.Hitbox.CFrame == targetCFrame
	local canPlace = require( game.ReplicatedStorage.Modules.Validations.CanPlace ).validate(clone.Hitbox)

	if not canPlace then
		clone:Destroy()
		return false
	end
	
	changeTransparency( 0 )
	
	-- Object Values
	local function addValue ( ins:Instance, name:string, value )
		ins.Name = name
		ins.Value = value
		ins.Parent = clone
	end
	
	addValue( Instance.new("StringValue"), "PlacedBy", sender.Name )
	addValue( Instance.new("ObjectValue"), "PlacedObject", object )
	
	return true
end

return event
