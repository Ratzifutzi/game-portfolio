Cooldown = false

game.ReplicatedStorage.ReportErrorToLocal.OnClientEvent:Connect(function(Color, Title, Text)
	Cooldown = true
	script.Parent.Visible = true
	script.Parent.Title.Text = Title
	script.Parent.Text.Text = Text
	script.Parent.ColorBar.BackgroundColor3 = Color
	
	script.Parent.Close.ShadowCol.Size = UDim2.new(1,0,1,4)
	
	wait()
	
	script.Parent.Close.ShadowCol:TweenSize(UDim2.new(0,0,1,4), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, ((#Text / 100) * 10))
	
	wait(((#Text / 100) * 10))
	
	Cooldown = false
	
	script.Parent.ColorBar.BackgroundColor3 = Color3.new(0, 0.807843, 0.0392157)
	wait(.5)
	script.Parent.ColorBar.BackgroundColor3 = Color
	wait(.5)
	script.Parent.ColorBar.BackgroundColor3 = Color3.new(0, 0.807843, 0.0392157)
	wait(.5)
	script.Parent.ColorBar.BackgroundColor3 = Color
	wait(.5)
	script.Parent.ColorBar.BackgroundColor3 = Color3.new(0, 0.807843, 0.0392157)
end)

script.Parent.Close.MouseButton1Click:Connect(function()
	local oldcol = script.Parent.Close.ShadowCol.BackgroundColor3
	if Cooldown == false then
		script.Parent.Visible = false
	else
		script.Parent.Close.ShadowCol.BackgroundColor3 = Color3.new(1,0,0)
		wait(.5)
		script.Parent.Close.ShadowCol.BackgroundColor3 = oldcol
	end
end)