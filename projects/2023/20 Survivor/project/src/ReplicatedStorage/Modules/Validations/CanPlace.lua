-- Validation if player can build there

ReplicatedStorage = game.ReplicatedStorage
RunService = game:GetService("RunService")
UserInputService = game.UserInputService
TweenService = game:GetService("TweenService")

local module = {}

module.validate = function( hitboxPart:BasePart )
	local config = require( game.ReplicatedStorage.Configuration )
	
	local touches = require(ReplicatedStorage.Modules.GetTouchingParts)(hitboxPart)
	local distance = (hitboxPart.Position - workspace.Values.CenterPart.Value.Position).Magnitude

	for k, ins:BasePart in pairs( touches ) do
		-- Contact with other building
		if table.find( ins:GetTags(), "PlacementBlocked" ) then
			return false
		end
		
		-- Contact with player
		if ins.Parent:FindFirstChild("Humanoid") then
			return false
		end
	end

	if distance < config.BuildSystem.MinDistanceFromCenter then
		return false
	end
	
	return true
end

return module
