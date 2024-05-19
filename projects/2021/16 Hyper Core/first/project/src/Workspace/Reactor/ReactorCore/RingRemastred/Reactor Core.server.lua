Speed = 1 * workspace.Sounds.Meltdown.TimePosition + 1
while true do 
	wait()
	for i = 0, 360, Speed do 
		script.Parent.CFrame = CFrame.new(script.Parent.Position)*CFrame.fromEulerAnglesXYZ(math.rad(i), math.rad(i), math.rad(i))
		wait(.001)
	end
end 
