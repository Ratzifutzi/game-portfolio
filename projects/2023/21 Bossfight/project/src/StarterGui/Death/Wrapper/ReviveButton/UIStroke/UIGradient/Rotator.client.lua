game:GetService("RunService").RenderStepped:Connect(function(dt)
	script.Parent.Rotation += 40 * dt
end)