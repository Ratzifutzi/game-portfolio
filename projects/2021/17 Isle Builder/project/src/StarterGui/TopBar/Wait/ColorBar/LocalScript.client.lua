i = 0

script.Parent.Parent.Changed:Connect(function()
	i = 0
	while script.Parent.Parent.Visible == true do
		local bar = script.Parent.Parent.ColorBar
		bar.Size = UDim2.new(0,0,1,4)
		bar:TweenSize(UDim2.new(1,0,1,4), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.5)
		wait(.5)
		i = i + 1
		if i > 10 then
			bar.BackgroundColor3 = Color3.fromRGB(255,0,0)
			script.Parent.Parent.Text.Text = "Loading Failed"
			for i = 0, 3 do
				local bar = script.Parent.Parent.ColorBar
				bar.Visible = true
				wait(.45)
				bar.Visible = false
				wait(.45)
			end
			script.Parent.Parent.Visible = false
			game.Lighting:FindFirstChild("Blur"):Destroy()
			game.Players.LocalPlayer:Kick("\n\nLoading your data has failed. There are 2 Options why:\n- Network error.\n- Roblox Error\n\nSend this code to an Developer: \n[D1]")
			
			break
		end
	end
end)