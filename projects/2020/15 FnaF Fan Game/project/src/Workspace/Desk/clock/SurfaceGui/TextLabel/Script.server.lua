while true do
	wait()
	if workspace.Values.Clock.Value == 0 then
		script.Parent.Text = "12AM"
	else
		script.Parent.Text = workspace.Values.Clock.Value.."AM"
	end
end