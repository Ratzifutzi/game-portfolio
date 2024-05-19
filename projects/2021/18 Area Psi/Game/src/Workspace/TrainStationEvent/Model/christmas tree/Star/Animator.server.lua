Star1 = script.Parent.Star1
Star2 = script.Parent.Star2

TS = game:GetService("TweenService")
Ti = TweenInfo.new(3.5,Enum.EasingStyle.Sine)

TweenLight = TS:Create(Star1, Ti, {
	Color = Color3.fromRGB(253, 255, 123)
})

TweenDark = TS:Create(Star1, Ti, {
	Color = Color3.fromRGB(126, 104, 62)
})

Star1.Changed:Connect(function()
	Star2.Color = Star1.Color
end)

while true do
	TweenLight:Play()
	wait(1.5)
	TweenDark:Play()
	wait(1.5)
end