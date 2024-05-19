workspace.Plot.gridsys.EnableGrid.Changed:Connect(function()
	for index, val in ipairs(workspace.Plot.gridsys.Grids:GetChildren()) do
		if workspace.Plot.gridsys.EnableGrid.Value == true and val.GridUsed.Value == false then
			if val.GridUsed.Value == false then
				val.SelectionBox.Visible = true
			else
				val.SelectionBox.Visible = false
			end
		else
			val.SelectionBox.Visible = false
		end
	end
end)

workspace.Plot.gridsys.GridColor.Changed:Connect(function()
	for index, val in ipairs(workspace.Plot.gridsys.Grids:GetChildren()) do
		val.SelectionBox.Color3 = workspace.Plot.gridsys.GridColor.Value
		val.SelectionBox.SurfaceColor3 = workspace.Plot.gridsys.GridColor.Value
	end
end)