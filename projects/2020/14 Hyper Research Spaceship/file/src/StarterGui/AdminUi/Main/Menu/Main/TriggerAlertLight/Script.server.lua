i=0
script.Parent.MouseButton1Click:Connect(function(player)
	if i == 0 then
		i=1
		workspace.Values.AlarmLights.Value=true
	else
		i=0
		workspace.Values.AlarmLights.Value=false
	end
end)

while true do
	wait()
	if workspace.Values.AlarmLights.Value==true then
		script.Parent.BackgroundColor3=Color3.new(0, 0.666667, 0)
	else
		script.Parent.BackgroundColor3=Color3.new(0.666667, 0, 0)
	end
end

