while true do
	wait()
	if workspace.Values.Blackout.Value == true then
		script.Parent.BrickColor = BrickColor.Black()
	else
		if workspace.Values.Alert.Value == true then
			script.Parent.BrickColor = BrickColor.Red()
			if workspace.Values.AlertBlink.Value == true then
				script.Parent.BrickColor = BrickColor.Black()
				wait(.5)
				script.Parent.BrickColor = BrickColor.Red()
				wait(.5)
			end
		else
			script.Parent.Color = Color3.new(0.231373, 0.647059, 0.47451)
		end
	end
	wait()
end