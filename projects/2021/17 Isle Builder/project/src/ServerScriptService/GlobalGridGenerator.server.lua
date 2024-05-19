xSize = nil
zSize = nil

for key, value in pairs(workspace.Plot.Plots:GetChildren()) do
	xSize = value.Size.Z / 5 - 1
	zSize = value.Size.X / 5 - 1
	for i = 0, xSize do
		for o = 0, zSize do
			local partCopy = value.ImgPart:Clone()
			partCopy.Name = i .. "-".. o .. "-" .. value.Name
			partCopy.Parent = workspace.Plot.gridsys.Grids
			partCopy.Transparency = 1
			partCopy.SelectionBox.Visible = false
			partCopy.Position = Vector3.new(partCopy.Position.X + (o * 5), partCopy.Position.Y, partCopy.Position.Z + (i * 5))
			
			local Placed = Instance.new("BoolValue")
			Placed.Parent = partCopy
			Placed.Name = "GridUsed"
			Placed.Value = false
		end
	end
end
