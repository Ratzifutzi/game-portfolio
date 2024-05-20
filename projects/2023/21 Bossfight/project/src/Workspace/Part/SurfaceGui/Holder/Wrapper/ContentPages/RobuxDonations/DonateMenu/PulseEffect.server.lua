TweenService = game:GetService("TweenService")
RunService = game:GetService("RunService")

Stroke = script.Parent.PulseUIStroke

DelayDuration = 2

LastPulse = tick()

RunService.RenderStepped:Connect(function()
	if tick() - LastPulse < DelayDuration then return nil end
	LastPulse = tick()
	
	Stroke.Thickness = 0
	Stroke.Transparency = 0
	TweenService:Create( Stroke, TweenInfo.new( 1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out ), {
		Thickness = 10,
		Transparency = 1
	} ):Play()
end)