while true do
	script.Parent.Power.Text = workspace.Values.Core.Cooling.Energy.Value .. " %"
	wait(5)
	
	if workspace.Values.Core.Cooling.Energy.Value > 80 then
		script.Parent.Power.BackgroundColor3 = Color3.new(0, 1, 0)
	else if workspace.Values.Core.Cooling.Energy.Value > 60 then
			script.Parent.Power.BackgroundColor3 = Color3.new(0.5, 1, 0)
		else if workspace.Values.Core.Cooling.Energy.Value > 30 then
				script.Parent.Power.BackgroundColor3 = Color3.new(0.666667, 1, 0)
			else if workspace.Values.Core.Cooling.Energy.Value > -1 then
					script.Parent.Power.BackgroundColor3 = Color3.new(1, 0, 0)
				end
			end
		end
	end
	
	power = workspace.Values.Core.Cooling.Energy
	ActiveCoolers = workspace.Values.Core.Cooling.CoolingPower
		if ActiveCoolers.Value < 2 then
			power.Value = power.Value + 2
		else
			power.Value = power.Value - math.random(1,2) * 2
	end
	
	if power.Value >= 100 then
		power.Value = 100
	end
	if power.Value <= 0 then
		power.Value = 0
		workspace.Values.Core.Cooling.Cooler1.Value = false
		workspace.Values.Core.Cooling.Cooler2.Value = false
		workspace.Values.Core.Cooling.Cooler3.Value = false
		workspace.Values.Core.Cooling.CoolingPower.Value = 0
	end
	
	
end