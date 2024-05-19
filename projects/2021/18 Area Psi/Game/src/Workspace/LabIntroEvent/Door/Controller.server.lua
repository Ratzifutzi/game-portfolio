
script.Parent.Close.Event:Connect(function()
	script.Parent.Openv.Value = false
	script.Parent.Openv.Moving.Value = true
	script.Parent.Part.SurfaceGui.BUTTON.Text = "CLOSING..."
	script.Parent.Part.SurfaceGui.BUTTON.TextColor3 = Color3.new(1, 0.952941, 0.294118)
	local TweenService = game:GetService("TweenService")

	local PanelRoot = script.Parent.DoorRoot

	script.Parent.Door:Play()

	local PanelSlideInfo = TweenInfo.new(script.Parent.Door.TimeLength) -- Let's use all defaults here

	local PanelSlideTween = TweenService:Create(PanelRoot, PanelSlideInfo, {
		CFrame = PanelRoot.CFrame * CFrame.new(-PanelRoot.Size.X + 0.1, 0, 0)
	})

	PanelSlideTween:Play()
	
		wait(script.Parent.Door.TimeLength)
		script.Parent.Part.SurfaceGui.BUTTON.Text = "OPEN"
		script.Parent.Part.SurfaceGui.BUTTON.TextColor3 = Color3.new(0.14902, 1, 0)
	
	script.Parent.Openv.Moving.Value = false
	
end)


script.Parent.Open.Event:Connect(function()
	script.Parent.Openv.Moving.Value = true
	script.Parent.Openv.Value = true
	script.Parent.Part.SurfaceGui.BUTTON.Text = "OPENING..."
	script.Parent.Part.SurfaceGui.BUTTON.TextColor3 = Color3.new(1, 0.952941, 0.294118)
	local TweenService = game:GetService("TweenService")

	local PanelRoot = script.Parent.DoorRoot
	
	script.Parent.Door:Play()

	local PanelSlideInfo = TweenInfo.new(script.Parent.Door.TimeLength) -- Let's use all defaults here

	local PanelSlideTween = TweenService:Create(PanelRoot, PanelSlideInfo, {
		CFrame = PanelRoot.CFrame * CFrame.new(PanelRoot.Size.X - 0.1, 0, 0)
	})

	PanelSlideTween:Play()
	
	if script.Parent.AutoClose.Value == false then
		wait(script.Parent.Door.TimeLength)
		script.Parent.Part.SurfaceGui.BUTTON.Text = "CLOSE"
		script.Parent.Part.SurfaceGui.BUTTON.TextColor3 = Color3.new(0.14902, 1, 0)
	else
		script.Parent.Part.SurfaceGui.BUTTON.Text = "PLEASE WAIT..."
		script.Parent.Part.SurfaceGui.BUTTON.TextColor3 = Color3.new(1, 0.952941, 0.294118)
		wait(script.Parent.AutoClose.Interval.Value)
		script.Parent.Close:Fire()
	end
	script.Parent.Openv.Moving.Value = false
end)
