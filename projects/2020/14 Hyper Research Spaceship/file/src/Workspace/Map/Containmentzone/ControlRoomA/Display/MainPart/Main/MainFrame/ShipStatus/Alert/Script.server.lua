while true do
	wait()
	if workspace.Values.AlarmLights.Value==true then
		script.Parent.Text="Alert: TRUE"
		script.Parent.TextColor3=Color3.new(1, 0, 0)
	else
		script.Parent.Text = "Alert: FALSE"
		script.Parent.TextColor3=Color3.new(0, 1, 0)
	end
end