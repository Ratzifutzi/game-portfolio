for key, Value in pairs(workspace.Events:GetChildren()) do
	if Value:IsA("Folder") then
		ChildNil = false
		CurChilds = Value:GetChildren()
		while ChildNil == false do
			for key2, Value2 in pairs(CurChilds) do
				ins = script.ParentFolder:Clone()
				ins.Parent = script.Parent.ScrollingFrame
				ins.Text = Value.Name
				ins.Position = UDim2.new(1,0,0,30 * (key - 1))
			end
		end
	elseif Value:IsA("BindableEvent") then
		ins = script.Event:Clone()
		ins.Parent = script.Parent.ScrollingFrame
		ins.Text = Value.Name
		ins.Position = UDim2.new(1,0,0,30 * (key - 1))
	end
end