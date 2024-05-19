function LightUpdate(Status,Type)
	
	if Type == "normal" then
		script.Parent.Color = Color3.new(0.635294, 1, 0.945098)
		script.Parent.Parent.Color = script.Parent.NormalColor.Value
	elseif Type == "alert" then
		script.Parent.Color = script.Parent.AlertColor.Value
		script.Parent.Parent.Color = script.Parent.AlertColor.Value
	end
	
	if Status == true then
		script.Parent.Enabled = true
		if Type == "normal" then
			script.Parent.Color = Color3.new(0.635294, 1, 0.945098)
			script.Parent.Parent.Color = script.Parent.NormalColor.Value
		elseif Type == "alert" then
			script.Parent.Color = script.Parent.AlertColor.Value
			script.Parent.Parent.Color = script.Parent.AlertColor.Value
		end
	else
		script.Parent.Enabled = false
		script.Parent.Parent.BrickColor = BrickColor.Black()
	end
	
end

LightUpdate(workspace.Lights.On.Value, workspace.Lights.Type.Value)

workspace.Lights.On.Changed:Connect(function()
	LightUpdate(workspace.Lights.On.Value, workspace.Lights.Type.Value)
end)

workspace.Lights.Type.Changed:Connect(function()
	LightUpdate(workspace.Lights.On.Value, workspace.Lights.Type.Value)
end)