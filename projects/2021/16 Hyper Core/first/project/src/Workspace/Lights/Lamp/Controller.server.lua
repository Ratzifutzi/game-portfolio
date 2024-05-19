while true do
	wait()
	if workspace.Values.Blackout.Value == true then
		script.Parent.BrickColor = BrickColor.Black()
		script.Parent.Light.Color = Color3.new(0, 0, 0)
	else
		if workspace.Values.Alert.Value == true then
			script.Parent.BrickColor = BrickColor.Red()
			script.Parent.Light.Color = Color3.new(1, 0, 0)
			if workspace.Values.AlertBlink.Value == true then
				script.Parent.Light.Color = Color3.new(0, 0, 0)
				script.Parent.BrickColor = BrickColor.Black()
				wait(.5)
				script.Parent.Light.Color = Color3.new(1, 0, 0)
				script.Parent.BrickColor = BrickColor.Red()
				wait(.5)
			end
		else
			script.Parent.BrickColor = BrickColor.White()
			script.Parent.Light.Color = Color3.new(1, 1, 1)
		end
	end
	wait()
end