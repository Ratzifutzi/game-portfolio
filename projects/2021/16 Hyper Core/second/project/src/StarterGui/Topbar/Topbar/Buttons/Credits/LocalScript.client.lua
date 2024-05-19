script.Parent.MouseButton1Click:Connect(function()
	script.Parent.Parent:TweenPosition(UDim2.new(1, -350, -3, 0), "InOut", "Quad", 1, true)
	script.Parent.Parent.Open.Text = "OPEN"
	script.Parent.Parent.open.Value = false
end)