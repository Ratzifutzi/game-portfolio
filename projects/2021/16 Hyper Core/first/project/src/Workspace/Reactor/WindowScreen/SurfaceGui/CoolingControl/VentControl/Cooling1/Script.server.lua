script.Parent.MouseButton1Click:Connect(function()
	if workspace.Values.Core.Cooling.Online.Value == true then
		if script.Value.Value.Value == true then
			script.Value.Value.Value = false
			workspace.Values.Core.Cooling.CoolingPower.Value = workspace.Values.Core.Cooling.CoolingPower.Value - 1
		else
			script.Value.Value.Value = true
			workspace.Values.Core.Cooling.CoolingPower.Value = workspace.Values.Core.Cooling.CoolingPower.Value + 1
		end
	end
end)

while true do
	wait()
	if script.Value.Value.Value == true then
		script.Parent.BackgroundColor3 = Color3.new(0, 1, 0)
	else
		script.Parent.BackgroundColor3 = Color3.new(1, 0, 0)
	end
end