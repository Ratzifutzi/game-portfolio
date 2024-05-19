script.Parent.MouseButton1Click:Connect(function()
	for i = 0 , 6 do
		wait(.2)
		workspace.Values.Clock.Value = i
	end
	script.Parent.Parent.Parent.Parent.Enabled = false
	
end)