while true do
	wait()
	if script.Parent.Value==true then
		game.Lighting.AlertColorCorrection.Enabled=true
	else
		game.Lighting.AlertColorCorrection.Enabled=false
	end
end