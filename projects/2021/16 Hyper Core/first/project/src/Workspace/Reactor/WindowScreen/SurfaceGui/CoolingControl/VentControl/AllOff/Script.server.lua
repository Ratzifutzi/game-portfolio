script.Parent.MouseButton1Click:Connect(function()
	if workspace.Values.Core.Cooling.Online.Value == true then
		workspace.Values.Core.Cooling.Cooler1.Value = false
		workspace.Values.Core.Cooling.Cooler2.Value = false
		workspace.Values.Core.Cooling.Cooler3.Value = false
		workspace.Values.Core.Cooling.CoolingPower.Value = 0
	end
end)