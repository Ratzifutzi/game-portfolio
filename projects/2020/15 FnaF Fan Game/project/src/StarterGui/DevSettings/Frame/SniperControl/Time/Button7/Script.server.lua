script.Parent.MouseButton1Click:Connect(function()
	workspace.Values.Clock.Value = script.Parent.Value.Value
	script.Parent.Parent.Parent.Parent.Parent.Enabled = false
end)