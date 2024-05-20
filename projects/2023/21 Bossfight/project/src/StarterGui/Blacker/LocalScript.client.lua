TweenService = game:GetService("TweenService")
ReplicatedStorage = game:GetService("ReplicatedStorage")

ToggleEvent = ReplicatedStorage.Events.CtC.ToggleBlacker

MoveTweenInfo = TweenInfo.new( .5, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut )

local POSITIONS = {
	[false] = {
		["Top"] = Vector2.new(0, 1),
		["Bottom"] = Vector2.new(0, 0)
	},
	[true] = {
		["Top"] = Vector2.new(0, 0),
		["Bottom"] = Vector2.new(0, 1)
	}
}

ToggleEvent.Event:Connect(function( enabled : boolean )
	for k, v in pairs( POSITIONS[enabled] ) do
		TweenService:Create( script.Parent[ k ], MoveTweenInfo, {
			AnchorPoint = v
		} ):Play()
	end
	
end)