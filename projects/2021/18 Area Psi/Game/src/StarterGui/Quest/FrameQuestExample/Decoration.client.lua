script.Parent.Text.Changed:Connect(function()
	script.Parent.Progress.TextTransparency = script.Parent.Text.TextTransparency
	script.Parent.Text.Size = UDim2.new(1,0,0,script.Parent.Text.TextBounds.Y)
	script.Parent.Progress.Size = UDim2.new(.999,0,0.25,0)
end)