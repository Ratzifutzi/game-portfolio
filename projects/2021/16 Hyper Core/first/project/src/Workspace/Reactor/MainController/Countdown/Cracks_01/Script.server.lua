script.Parent.Visible = false


while true do
	wait()
	if workspace.Values.MeltdownInProgress.Value == true then
		length = workspace.Sounds.Meltdown.TimeLength
		waitt = math.random(10, length - 20)
		print(waitt)
		wait(waitt)
		
		workspace.Sounds.Event.glass_break_01:Play()
		script.Parent.Visible = true
		
		
		wait(workspace.Sounds.Meltdown.TimeLength)
	end
end