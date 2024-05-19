while true do
	wait()
	if script.Parent.Value.Value.Value == true then
		script.Parent.Laser.Transparency = 0
	else
		script.Parent.Laser.Transparency = 1
	end
end