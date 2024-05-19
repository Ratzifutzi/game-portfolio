
script.Parent.MouseButton1Click:Connect(function()
	local plr = game.Players.LocalPlayer
	
	if script.Parent.Parent.open.Value == false then
		script.Parent.Parent.open.Value = true
		script.Parent.Parent:TweenPosition(UDim2.new(1, -350, 0, 0), "InOut", "Quad", 1, true)
		script.Parent.Text = "CLOSE"
	elseif script.Parent.Parent.open.Value == true then
		script.Parent.Parent.open.Value = false
		script.Parent.Parent:TweenPosition(UDim2.new(1, -350, -3, 0), "InOut", "Quad", 1, true)
		script.Parent.Text = "OPEN"
	end
end)