while true do
	wait()
	if workspace.Values.Blackout.Value == true then
		script.Parent.BrickColor = BrickColor.Black()
	else
		if workspace.Values.AlertLight.Value == true then
			script.Parent.BrickColor = BrickColor.Red()
		else
			script.Parent.Color = Color3.new(0.231373, 0.647059, 0.47451)
		end
	end
	wait()
end