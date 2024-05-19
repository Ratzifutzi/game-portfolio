script.Parent.MouseEnter:Connect(function()
	script.Parent.TextLabel.Hover:TweenPosition(UDim2.new(0,0,2,0), "InOut", "Quad", .5, true)
	for i = 0,10 do
		wait(.01)
		script.Parent.TextLabel.Hover.TextTransparency = 1 - i / 10
	end
end)

script.Parent.MouseLeave:Connect(function()
	script.Parent.TextLabel.Hover:TweenPosition(UDim2.new(0.5,0,2,0), "InOut", "Quad", .5, true)
	for i = 0,10 do
		wait(.01)
		script.Parent.TextLabel.Hover.TextTransparency = i / 10
	end
end)


