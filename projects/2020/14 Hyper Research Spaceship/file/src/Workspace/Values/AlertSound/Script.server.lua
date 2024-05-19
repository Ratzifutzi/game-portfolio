while true do
	wait()
	if script.Parent.Value==true then
		workspace.Sounds.Alert.Playing=true
		wait(workspace.Sounds.Alert.TimeLength+1)
	end
end