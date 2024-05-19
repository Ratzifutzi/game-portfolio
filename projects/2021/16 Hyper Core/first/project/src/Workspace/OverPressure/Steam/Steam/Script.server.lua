script.Parent.Enabled = false

while true do
	wait()
	if workspace.Values.MeltdownInProgress.Value == true then
		length = workspace.Sounds.Meltdown.TimeLength
		waitt = math.random(10, length - 20)
		print(waitt)
		wait(waitt)
		
		workspace.Sounds.Event.metal_break_02:Play()
		script.Parent.Enabled = true
		workspace.Sounds.Steam:Play()
		
		wait(workspace.Sounds.Meltdown.TimeLength)
	end
end