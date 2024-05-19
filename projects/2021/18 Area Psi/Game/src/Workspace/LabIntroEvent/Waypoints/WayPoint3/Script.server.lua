script.Parent.Transparency = 1

script.Parent.Touched:Connect(function()
	local curid = script.Parent.Parent.CurrentWaypoint.Value
	if script.Parent.Name == "WayPoint".. curid then
		script.Parent.Parent.CurrentWaypoint.Value = script.Parent.Parent.CurrentWaypoint.Value + 1
	end
end)

script.Parent.Parent.CurrentWaypoint.Changed:Connect(function()
	local curid = script.Parent.Parent.CurrentWaypoint.Value
	if script.Parent.Name == "WayPoint".. curid then
		script.Parent.BillboardGui.Enabled = true
	else
		script.Parent.BillboardGui.Enabled = false
	end
end)