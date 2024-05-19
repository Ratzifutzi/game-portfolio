script.Parent.MouseButton1Click:Connect(function()
	workspace.Values.Core.Cooling.ButtonsLocked.Value = true
	script.Alert:Play()
	script.Parent.Text = "PLEASE WAIT..."
	script.Parent.BackgroundColor3 = Color3.new(1, 1, 0)
	wait(5)
	if workspace.Values.Core.Cooling.Online.Value == true then
		workspace.Values.Core.Cooling.Online.Value = false
		script.Parent.Text = "ENABLE COOLING SYSTEM"
		script.Parent.BackgroundColor3 = Color3.new(0, 1, 0)
		workspace.Values.Core.Cooling.Cooler1.Value = false
		workspace.Values.Core.Cooling.Cooler2.Value = false
		workspace.Values.Core.Cooling.Cooler3.Value = false
		workspace.Values.Core.Cooling.CoolingPower.Value = 0
	else
		workspace.Values.Core.Cooling.Online.Value = true
		script.Parent.Text = "DISABLE COOLING SYSTEM - EMERGENCY ONLY"
		script.Parent.BackgroundColor3 = Color3.new(1, 0, 0)
	end
end)