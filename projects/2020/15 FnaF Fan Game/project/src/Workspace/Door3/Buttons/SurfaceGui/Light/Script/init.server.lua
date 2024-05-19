burntime = 0
on = false

script.Parent.MouseButton1Click:Connect(function()
	if workspace.Values.FuseLife.Value >= 1 then
		if on == false then
			on = true
			script.Parent.LightLeft.SpotLight.Enabled = true
			script.SoundLight.Playing = true
		else
			on = false
			script.Parent.LightLeft.SpotLight.Enabled = false
			script.SoundLight.Playing = false
		end
	end
end)

while true do
	if workspace.Values.FuseLife.Value <= 1 then
		script.Parent.BackgroundColor3 = Color3.new(0.223529, 0.203922, 0)
	end
	if on == true then
		burntime = burntime + 0.001
		if burntime >= 1 then
			burntime = 0
			workspace.Values.FuseLife.Value = workspace.Values.FuseLife.Value - 1
		end
	end
	wait()
end