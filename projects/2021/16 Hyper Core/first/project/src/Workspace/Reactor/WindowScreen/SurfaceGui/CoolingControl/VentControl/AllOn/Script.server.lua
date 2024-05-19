script.Parent.MouseButton1Click:Connect(function()
	if workspace.Values.Core.Cooling.Online.Value == true then
		workspace.Values.Core.Cooling.Cooler1.Value = true
		workspace.Values.Core.Cooling.Cooler2.Value = true
		workspace.Values.Core.Cooling.Cooler3.Value = true
		workspace.Values.Core.Cooling.CoolingPower.Value = 3
	end
end)