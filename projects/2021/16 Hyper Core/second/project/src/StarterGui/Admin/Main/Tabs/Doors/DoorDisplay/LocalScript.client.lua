script.Parent.Parent.DoorName.Changed:Connect(function()
	if workspace.Doors:FindFirstChild(script.Parent.Parent.DoorName.Text) then
		script.Parent.Text = "Door Found!"
		if not script.Parent.Parent.TaggedDoor.Value.Name == script.Parent.Parent.DoorName.Text then
			
		end
	else
		script.Parent.Text = ""
	end
end)