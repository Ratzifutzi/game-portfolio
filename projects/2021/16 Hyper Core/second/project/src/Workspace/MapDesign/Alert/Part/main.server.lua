
	script.Parent.PointLight.Enabled = false
	script.Parent.SurfaceLight.Enabled = false


workspace.Values.RotAlert.Changed:Connect(function()
	
	local val = workspace.Values.RotAlert.Value
	
	
	if workspace.Values.Blackout.Value == false then
		script.Parent.PointLight.Enabled = val
		script.Parent.SurfaceLight.Enabled = val
	end
	
	
end)

workspace.Values.Blackout.Changed:Connect(function()
	local val = workspace.Values.Blackout.Value
	
	script.Parent.PointLight.Enabled = true
	script.Parent.SurfaceLight.Enabled = true
	
	if workspace.Values.RotAlert.Value == true and val == true then
		script.Parent.PointLight.Enabled = false
		script.Parent.SurfaceLight.Enabled = false
	end
	if workspace.Values.RotAlert.Value == true and val == false then
		script.Parent.PointLight.Enabled = true
		script.Parent.SurfaceLight.Enabled = true
	end
end)