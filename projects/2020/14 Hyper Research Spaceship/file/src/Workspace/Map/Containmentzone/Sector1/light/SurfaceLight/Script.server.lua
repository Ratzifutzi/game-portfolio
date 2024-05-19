while true do
	wait()
	if workspace.Values.AlarmLights.Value==true then
		script.Parent.Color=Color3.new(1, 0, 0)
	else
		script.Parent.Color=Color3.new(1, 1, 1)
	end
end