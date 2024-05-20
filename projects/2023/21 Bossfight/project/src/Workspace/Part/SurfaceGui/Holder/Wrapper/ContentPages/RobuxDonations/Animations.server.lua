local TweenService = game:GetService("TweenService")

local HoverTweenInfo = TweenInfo.new( .3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out )

for _, button: TextButton in pairs( script.Parent:GetChildren() ) do
	if not button:IsA("TextButton") then continue end
	
	button.MouseEnter:Connect(function()
		TweenService:Create( button, HoverTweenInfo, {
			BackgroundTransparency = 0.5
		} ):Play()
	end)
	
	button.MouseLeave:Connect(function()
		TweenService:Create( button, HoverTweenInfo, {
			BackgroundTransparency = 0
		} ):Play()
	end)
end