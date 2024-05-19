_Gradient = script.Parent.UIGradient
_Config = script.Parent.Configuration

RunService = game:GetService("RunService")

LastMove = tick()

RunService.RenderStepped:Connect(function()
	_Gradient.Rotation += (tick() - LastMove) * _Config.RotationSpeed.Value
	
	LastMove = tick()
end)