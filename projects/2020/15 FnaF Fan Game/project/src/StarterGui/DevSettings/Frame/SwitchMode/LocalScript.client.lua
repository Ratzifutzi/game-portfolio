mode = 0

if mode == 1 then
	script.Parent.Text = "Switch to: 'Fast' Mode"
	mode = 0
	script.Parent.Parent.FastControl.Visible = false
	script.Parent.Parent.SniperControl.Visible = true
else
	script.Parent.Text = "Switch to: 'Sniper' Mode"
	mode = 1
	script.Parent.Parent.FastControl.Visible = true
	script.Parent.Parent.SniperControl.Visible = false
end

script.Parent.MouseButton1Click:Connect(function()
	if mode == 1 then
		script.Parent.Text = "Switch to: 'Fast' Mode"
		mode = 0
		script.Parent.Parent.FastControl.Visible = false
		script.Parent.Parent.SniperControl.Visible = true
	else
		script.Parent.Text = "Switch to: 'Sniper' Mode"
		mode = 1
		script.Parent.Parent.FastControl.Visible = true
		script.Parent.Parent.SniperControl.Visible = false
	end
end)