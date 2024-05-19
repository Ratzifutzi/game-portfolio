

workspace.Backrooms.BackroomsCase.Trigger.Touched:Connect(function()
	workspace.LabIntroEvent.Lamps:Stop()
	workspace.LabIntroEvent.Music:Stop()
	script.Disabled = true
	script.Parent.Enabled = true
	workspace.Backrooms.Glitch:Play()
	wait(workspace.Backrooms.Glitch.TimeLength)
	script.Parent.Frame.VideoFrame.Visible = false
	workspace.Backrooms.BackroomsEnding:Play()
end)