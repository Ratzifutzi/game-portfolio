while true do
	wait()
	if workspace.Values.ECS.InProgress.Value == true then
		script.Parent.Enabled = true
	else
		script.Parent.Enabled = false
	end
end