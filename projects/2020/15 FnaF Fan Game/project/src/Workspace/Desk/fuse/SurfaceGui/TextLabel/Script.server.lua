while true do
	wait()
	if workspace.Values.FuseLife.Value == 10 then
		script.Parent.Text = "Fuses: OK"
		script.Parent.TextColor3 = Color3.new(0, 1, 0)
	end
	
	if workspace.Values.FuseLife.Value <= 6 then
		script.Parent.Text = "Fuses: DANGER"
		script.Parent.TextColor3 = Color3.new(1, 1, 0)
	end
	
	if workspace.Values.FuseLife.Value <= 3 then
		script.Parent.TextColor3 = Color3.new(1, 0, 0)
		script.Parent.Text = "Fuses: DANGER"
	end
	if workspace.Values.FuseLife.Value <= 1 then
		script.Parent.Text = "Fuses: BLOWN"
		script.Parent.TextColor3 = Color3.new(1, 0, 0)
		script.Parent.Parent.Parent.Parent.Fan.rot.Spin.Disabled = true
		script.Parent.Parent.Parent.Parent.Fan.rot.Script.Disabled = true
		script.Parent.Parent.Parent.Parent.Fan.rot.Fansound:Stop()
		script.Parent.Parent.Parent.Parent.Fan.rot.ParticleEmitter.Enabled = true
		wait(.4)
		script.Parent.TextColor3 = Color3.new(0.352941, 0, 0)
		wait(.4)
	else
		script.Parent.Parent.Parent.Parent.Fan.rot.Spin.Disabled = false
		script.Parent.Parent.Parent.Parent.Fan.rot.Script.Disabled = false
		script.Parent.Parent.Parent.Parent.Fan.rot.ParticleEmitter.Enabled = false
	end
end