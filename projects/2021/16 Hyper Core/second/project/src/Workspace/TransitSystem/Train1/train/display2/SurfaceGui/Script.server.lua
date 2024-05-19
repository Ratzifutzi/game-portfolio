script.Parent.Parent.Parent.Parent.NextStation.Changed:Connect(function()
	if script.Parent.Parent.Parent.Parent.linenumber.Value > 0 then
		script.Parent.destination.Text = script.Parent.Parent.Parent.Parent.NextStation.Value
	end
end)

script.Parent.Parent.Parent.Parent.linenumber.Changed:Connect(function()
	if script.Parent.Parent.Parent.Parent.linenumber.Value == 0 then
		script.Parent.lineid.Text = "END STATION"
		script.Parent.destination.Text = "ENJOY YOUR DAY!"
	else
		script.Parent.lineid.Text = script.Parent.Parent.Parent.Parent.linenumber.Value
		script.Parent.destination.Text = script.Parent.Parent.Parent.Parent.NextStation.Value
	end
end)