while true do
	wait()
	if workspace.Values.Evacuation.Value==true then
		script.Parent.Text="Evacuation: TRUE"
		script.Parent.TextColor3=Color3.new(1, 0, 0)
	else
		script.Parent.Text = "Evacuation: FALSE"
		script.Parent.TextColor3=Color3.new(0, 1, 0)
	end
end