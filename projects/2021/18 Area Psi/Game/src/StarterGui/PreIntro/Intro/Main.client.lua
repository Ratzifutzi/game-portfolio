workspace.Events.PreIntro.FireToLocal.OnClientEvent:Connect(function()
	script.Parent.Visible = true
	local TS = game:GetService("TweenService")
	local TI = TweenInfo.new(.9, Enum.EasingStyle.Sine)
	local WhiteTween = TS:Create(script.Parent, TI, {
		BackgroundColor3 = Color3.new(1,1,1)
	})
	WhiteTween:Play()
	wait(.90)
	script.Parent.Visible = true
	script.Parent.Parent.Texts.Visible = false
	script.sound:Play()
	wait(.45)
	script.Parent.ImageLabel.a.Visible = false
	wait(1.3)
	script.Parent.ImageLabel.b.Visible = false
	wait(1.6)
	script.Parent.ImageLabel.c.Visible = false
	wait(1.5)
	script.Parent.ImageLabel.ImageColor3 = Color3.new(1, 1, 1)
	repeat
		wait()
	until script.sound.Playing == false
	script.Parent.Visible = false
	script.Parent.Parent.Texts.Visible = true
	wait(1.5)
	workspace.TrainStationEvent.TrainStation:Play()
end)