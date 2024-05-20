local TweenService = game:GetService("TweenService")

local MoveTweenInfo = TweenInfo.new( 120, Enum.EasingStyle.Linear )

local MoveTween = TweenService:Create( script.Parent, MoveTweenInfo, {
	Position = UDim2.new(-1, 0, -1, 0)
} ) MoveTween:Play()

MoveTween.Completed:Connect(function()
	script.Parent.Position = UDim2.new(0, 0, 0, 0)
	MoveTween:Play()
end)