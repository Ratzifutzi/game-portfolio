beepspeed = 0

script.Parent.Trigger.Touched:Connect(function()
	beepspeed = 1
end)

script.Parent.Trigger.TouchEnded:Connect(function()
	beepspeed = 0
end)


while true do
	if beepspeed == 0 then
		wait()
		script.Parent.Lamp1.BrickColor = BrickColor.White()
		script.Parent.Lamp2.BrickColor = BrickColor.White()
		script.Parent.Lamp3.BrickColor = BrickColor.White()
		script.Parent.Lamp4.BrickColor = BrickColor.White()
		script.Parent.Lamp5.BrickColor = BrickColor.White()
		script.Parent.Lamp6.BrickColor = BrickColor.White()
		script.Parent.Lamp1.BrickColor = BrickColor.White()
		script.Parent.Lamp2.BrickColor = BrickColor.White()
		Color3.new(1,1,1)
	elseif beepspeed == 1 then
		script.Parent.beep:Play()
		script.Parent.Lamp1.SurfaceLight.Color = Color3.new(1,0,0)
		script.Parent.Lamp2.SurfaceLight.Color = Color3.new(1,0,0)
		script.Parent.Lamp6.BrickColor = BrickColor.Red()
		script.Parent.Lamp5.BrickColor = BrickColor.Red()		
		script.Parent.Lamp4.BrickColor = BrickColor.Black()
		script.Parent.Lamp3.BrickColor = BrickColor.Black()
		script.Parent.Lamp2.BrickColor = BrickColor.Black()
		script.Parent.Lamp1.BrickColor = BrickColor.Black()
		wait(.1)
		script.Parent.Lamp6.BrickColor = BrickColor.Black()
		script.Parent.Lamp5.BrickColor = BrickColor.Black()	
		script.Parent.Lamp4.BrickColor = BrickColor.Red()
		script.Parent.Lamp3.BrickColor = BrickColor.Red()
		script.Parent.Lamp2.BrickColor = BrickColor.Black()
		script.Parent.Lamp1.BrickColor = BrickColor.Black()
		wait(.1)
		script.Parent.Lamp6.BrickColor = BrickColor.Black()
		script.Parent.Lamp5.BrickColor = BrickColor.Black()	
		script.Parent.Lamp4.BrickColor = BrickColor.Black()
		script.Parent.Lamp3.BrickColor = BrickColor.Black()
		script.Parent.Lamp2.BrickColor = BrickColor.Red()
		script.Parent.Lamp1.BrickColor = BrickColor.Red()
		wait(.1)
		script.Parent.Lamp6.BrickColor = BrickColor.Black()
		script.Parent.Lamp5.BrickColor = BrickColor.Black()	
		script.Parent.Lamp4.BrickColor = BrickColor.Black()
		script.Parent.Lamp3.BrickColor = BrickColor.Black()
		script.Parent.Lamp2.BrickColor = BrickColor.Black()
		script.Parent.Lamp1.BrickColor = BrickColor.Black()
		script.Parent.beep:Stop()
		wait(.3)
	end
	wait()
end