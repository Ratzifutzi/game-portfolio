function TypeWriter(obj, text)
	for i = 1, #text,1 do
		wait(.2)
		obj.Text = string.sub(text,1,i)
	end
end
function TypeWriterFast(obj, text)
	for i = 1, #text,1 do
		wait(.05)
		obj.Text = string.sub(text,1,i)
	end
end

TS = game:GetService("TweenService")
FlashTI = TweenInfo.new(2,Enum.EasingStyle.Linear, Enum.EasingDirection.In)
FlashTween = TS:Create(script.Parent.Flasher, FlashTI, {
	BackgroundTransparency = 1
})
FlashTI = TweenInfo.new(2,Enum.EasingStyle.Linear, Enum.EasingDirection.In,0 ,true)
FlashTweenText = TS:Create(script.Parent.TextLabel, FlashTI, {
	TextTransparency = 0
})




workspace.Events.DeathEvent.FireToLocal.OnClientEvent:Connect(function()
	script.Parent.TextLabel.Text = ""
	script.Parent.SubText.Text = ""
	script.Parent.SubText.TextTransparency = 1
	script.Parent.Enabled = true
	workspace.DeathEvent.Uplifter.TimePosition = 10
	workspace.DeathEvent.Uplifter:Play()
	FlashTween:Play()
	wait(2)
	FlashTweenText:Play()
	TypeWriter(script.Parent.TextLabel, "YOU ARE DEAD")
	wait(3)
	script.Parent.SubText.TextTransparency = 0
	TypeWriterFast(script.Parent.SubText, "Better luck next time.")
	wait(21)
	print("boom")
end)