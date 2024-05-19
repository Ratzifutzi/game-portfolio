while true do
	wait()
	if workspace.Values.AlarmLights.Value==true or workspace.Values.Evacuation.Value==true or workspace.Values.ContainmentBreach.Value==true then
		script.Parent.Text="DANGER"
		script.Parent.TextColor3=Color3.new(1, 0, 0)
	else
		script.Parent.Text = "OK"
		script.Parent.TextColor3=Color3.new(0, 1, 0)
	end
end