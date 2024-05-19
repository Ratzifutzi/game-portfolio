
while true do
	wait()
	if workspace.Values.AlarmLights.Value==true then
		wait(1.5)
		script.Parent.PointLight.Enabled=true
		wait(.05)
		script.Parent.PointLight.Enabled=false
	else
		script.Parent.PointLight.Enabled=false
	end
end