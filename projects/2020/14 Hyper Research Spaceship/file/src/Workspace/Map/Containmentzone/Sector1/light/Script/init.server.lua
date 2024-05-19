while true do
	wait()
	if workspace.Values.AlarmLights.Value==true then
		script.Parent.BrickColor=BrickColor.Red()
	else
		script.Parent.BrickColor=BrickColor.White()
	end
end