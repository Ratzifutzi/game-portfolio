ReplicatedStorage = game:GetService("ReplicatedStorage")

local Config = require( ReplicatedStorage.Configuration )

local HITBOX = script.Parent.Hitbox

local Triggered = false
local TriggeredTick = tick()
local Exploded = false

HITBOX.Touched:Connect(function( hit : BasePart )
	if not hit.Parent:FindFirstChild("Humanoid") then return end
	if Triggered == true then return end
	
	Triggered = true
	TriggeredTick = tick()
	
	script.Parent.Hitbox.Triggered:Play()
	
	print("TRIGGERED")
	
	--------------------------
	local humanoidTouching = true
	repeat 
		wait( Config.Defenses.MineMinContact )
		humanoidTouching = false
		script.Parent.Hitbox.CanCollide = true
		
		for k, touching : BasePart in pairs( script.Parent.Hitbox:GetTouchingParts() ) do
			if touching.Parent:FindFirstChild("Humanoid") then 
				humanoidTouching = true
			end
		end
		
		script.Parent.Hitbox.CanCollide = false
	until humanoidTouching == false
	--------------------------
	
	if not hit.Parent:FindFirstChild("Humanoid") then return end
	if Triggered == false then return end
	if Exploded then return end

	Exploded = true

	local explosion = Instance.new("Explosion")

	explosion.Position = hit.Position
	explosion.BlastRadius = 10
	explosion.BlastPressure = 100
	explosion.ExplosionType = Enum.ExplosionType.NoCraters

	explosion.Parent = game.Workspace
	script.Parent.Hitbox.Explosion:Emit(5)
	script.Parent.Hitbox.BoomSound:Play()

	script.Parent.Mine:Destroy()

	wait(3)

	script.Parent:Destroy()
end)

HITBOX.TouchEnded:Connect(function( hit : BasePart )
	
end)
