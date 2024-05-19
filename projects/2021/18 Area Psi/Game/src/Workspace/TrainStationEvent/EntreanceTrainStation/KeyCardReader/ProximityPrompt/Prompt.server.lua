promptReady = false
script.Parent.Enabled = false

script.Parent.Triggered:Connect(function()
	if promptReady == true then
		promptReady = false
		script.Parent.Enabled = false
		script.Parent.Parent.SurfaceGui.ImageLabel.Visible = true
		wait(.5)
		script.Parent.Parent.SurfaceGui.ImageLabel.Frame:TweenPosition(UDim2.new(1,0,0,0), "InOut", "Sine", 2)
	end
end)

workspace.Events.PreIntro.Event:Connect(function()
	promptReady = true
	script.Parent.Enabled = true
end)