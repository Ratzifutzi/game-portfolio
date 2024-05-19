activated = false

workspace.Values.PlayNeurotoxinEvent.Changed:Connect(function()
	if workspace.Values.PlayNeurotoxinEvent.Value == true then
		workspace.Sounds.NeuroToxinSong:Play()
		workspace.Values.Blackout.Value = true
		wait(4)
		workspace.Sounds.Ambient.Volume = 0
		workspace.Sounds.NeuroToxinWarning:Play()
		
		local Camera = workspace.CurrentCamera
		repeat wait()
			Camera.CameraType = Enum.CameraType.Scriptable
		until Camera.CameraType == Enum.CameraType.Scriptable
		
		print(Camera.CameraType)
		Camera.CFrame = script.CutSceneCam.Value.CFrame
		
		wait(10)
		workspace.Values.Alert.Value = true
		workspace.Values.Blackout.Value = false
	end
end)