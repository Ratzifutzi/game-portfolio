while true do
	wait()
	if workspace.Values.ContainmentBreach.Value==true then
		script.Parent.Text="Containment breach: TRUE"
		script.Parent.TextColor3=Color3.new(1, 0, 0)
	else
		script.Parent.Text = "Containment breach: FALSE"
		script.Parent.TextColor3=Color3.new(0, 1, 0)
	end
end