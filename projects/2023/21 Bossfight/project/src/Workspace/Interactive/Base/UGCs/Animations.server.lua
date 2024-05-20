local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local ObjectsToRotate = {}

for k, v : BasePart in pairs( script.Parent:GetDescendants() ) do
	if not v:HasTag("Spin") then continue end
	
	local highPos = v.Position + Vector3.new(0, 3, 0)
	local lowPos = v.Position
	
	table.insert( ObjectsToRotate, v )
	
	------------------------------
	local riseTween = TweenService:Create( v, TweenInfo.new( 1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut ), {
		Position = highPos
	} )
	local dropTween = TweenService:Create( v, TweenInfo.new(.6, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
		Position = lowPos
	} )

	riseTween.Completed:Connect(function()
		v.Position = highPos

		dropTween:Play()
	end)
	dropTween.Completed:Connect(function()
		v.Position = lowPos

		riseTween:Play()
	end)

	riseTween:Play()
end