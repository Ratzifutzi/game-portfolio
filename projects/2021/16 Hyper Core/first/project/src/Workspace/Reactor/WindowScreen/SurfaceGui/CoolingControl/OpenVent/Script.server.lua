script.Parent.Parent.VentControl.Visible = false
i = true
script.Parent.Parent.VentControl.Visible = false
script.Parent.BackgroundColor3 = Color3.new(1, 0, 0)
workspace.Values.Core.Cooling.ButtonsLocked.Value = true

script.Parent.MouseButton1Click:Connect(function()
	script.sound:Play()
		if i == true then
			i = false
			script.Parent.Parent.VentControl.Visible = true
			script.Parent.BackgroundColor3 = Color3.new(0, 1, 0)
			workspace.Values.Core.Cooling.ButtonsLocked.Value = false
		else
			i = true
		script.Parent.Parent.VentControl.Visible = false
		workspace.Values.Core.Cooling.Cooler1.Value = false
		workspace.Values.Core.Cooling.Cooler2.Value = false
		workspace.Values.Core.Cooling.Cooler3.Value = false
		script.Parent.BackgroundColor3 = Color3.new(1, 0, 0)
		workspace.Values.Core.Cooling.ButtonsLocked.Value = true
		end
end)

