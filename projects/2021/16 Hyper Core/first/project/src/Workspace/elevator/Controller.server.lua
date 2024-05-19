open = false


function openDoor()
	if open == false then
		open = true
		script.Parent.Sounds.Move.PitchShiftSoundEffect.Enabled = false
		
		script.Parent.Sounds.Move.Playing = true

		for i = script.Parent.Upper.Position.Y, script.Parent.Upper.Position.Y + script.Parent.Upper.Size.Y * 10 do
			script.Parent.Lower.Position = Vector3.new(script.Parent.Lower.Position.X, script.Parent.Lower.Position.Y - 0.1, script.Parent.Lower.Position.Z)
			script.Parent.Upper.Position = Vector3.new(script.Parent.Upper.Position.X, script.Parent.Upper.Position.Y + 0.1, script.Parent.Upper.Position.Z)
			wait(.001)
		end

		script.Parent.Sounds.Move.Playing = false
		script.Parent.Sounds.End:Play()
	end
end

function closeDoor()
	if open == true then
		open = false
		script.Parent.Sounds.Move.PitchShiftSoundEffect.Enabled = true
		script.Parent.Sounds.Move.Playing = true

		for i = script.Parent.Upper.Position.Y, script.Parent.Upper.Position.Y + script.Parent.Upper.Size.Y * 10 do
			script.Parent.Lower.Position = Vector3.new(script.Parent.Lower.Position.X, script.Parent.Lower.Position.Y + 0.1, script.Parent.Lower.Position.Z)
			script.Parent.Upper.Position = Vector3.new(script.Parent.Upper.Position.X, script.Parent.Upper.Position.Y - 0.1, script.Parent.Upper.Position.Z)
			wait(.001)
		end

		script.Parent.Sounds.Move.Playing = false
		script.Parent.Sounds.End:Play()
		script.Parent.Sounds.Move.PitchShiftSoundEffect.Enabled = false
	end
end

while true do
	wait()
	if script.Parent.Open.Value == true then
		script.Parent.Open.Value = false
		openDoor()
	end
	
	if script.Parent.Close.Value == true then
		script.Parent.Close.Value = false
		closeDoor()
	end
end

