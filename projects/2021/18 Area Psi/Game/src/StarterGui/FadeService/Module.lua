local module = {}

module.FadeIn = function(time, color)
	local TS = game:GetService("TweenService")
	local TI = TweenInfo.new(time, Enum.EasingStyle.Linear)
	
	script.Parent.Frame.BackgroundColor3 = color
	
	TS:Create(script.Parent.Frame, TI, {BackgroundTransparency = 0}):Play()
end
module.FadeOut = function(time)
	local TS = game:GetService("TweenService")
	local TI = TweenInfo.new(time, Enum.EasingStyle.Linear)

	TS:Create(script.Parent.Frame, TI, {BackgroundTransparency = 1}):Play()
end

return module
