local TweenService = game:GetService("TweenService")
local TweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)

local TextFadeInTween = TweenService:Create(script.Parent.Title, TweenInfo, {TextTransparency = 0})
local TextFadeOutTween = TweenService:Create(script.Parent.Title, TweenInfo, {TextTransparency = 1})

script.Parent.Title.Changed:Connect(function()
	script.Parent.Text.TextTransparency = script.Parent.Title.TextTransparency
end)

script.Parent.StartAnimation.Event:Connect(function()
	script.Parent.Visible = true
	script.Parent.Title.TextTransparency = 1
	script.Parent.Size = UDim2.new(0,0,.2,0)
	wait()
	script.Parent:TweenSize(UDim2.new(1,0,.2,0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quart,1.5)
	wait(1.5)
	TextFadeInTween:Play()
end)

script.Parent.EndAnimation.Event:Connect(function()
	TextFadeOutTween:Play()
	wait(1)
	script.Parent:TweenSize(UDim2.new(0,0,.2,0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quart,1.5)
	wait(1.5)
	script.Parent.Visible = false
end)