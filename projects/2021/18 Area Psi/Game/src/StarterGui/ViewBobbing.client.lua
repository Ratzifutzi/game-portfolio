-- I DIDN'T CREATE THIS, I MODIFIED IT FROM SOMETHING ELSE

repeat wait(1) until game.Players.LocalPlayer.Character

camera = game.Workspace.CurrentCamera
character = game.Players.LocalPlayer.Character

Z = 1

damping = character.Humanoid.WalkSpeed / 3

PI = 3.1415926

Tick = 1.2

running = false
strafing = false

character.Humanoid.Strafing:connect(function(bool)
	strafing = bool
end)

character.Humanoid.Jumping:connect(function()
	running = false
end)

character.Humanoid.Swimming:connect(function()
	running = false
end)

character.Humanoid.Running:connect(function(speed)
	if speed > 0.1 then
		running = true
	else
		running = false
	end
end)

function mix(par1, par2, factor)
	return par2 + (par1 - par2) * factor
end

while true do
	game:GetService("RunService").RenderStepped:wait()
	
	fps = (camera.CoordinateFrame.p - character.Head.Position).Magnitude
	
	if fps < 0.52 then
		Z = 1
	else
		Z = 1
	end
	
	if running == true and strafing == false then
		Tick = Tick + character.Humanoid.WalkSpeed / 92 --Calculate Bobbing speed.
	else
		if Tick > 0 and Tick < PI / 2 then
			Tick = mix(Tick, PI / 2, 0.9)
		end
		if Tick > PI / 2 and Tick < PI then
			Tick = mix(Tick, PI / 2, 0.9)
		end
		if Tick > PI and Tick < PI * 1.5 then
			Tick = mix(Tick, PI * 1.5, 0.9)
		end
		if Tick > PI * 1.5 and Tick < PI * 2 then
			Tick = mix(Tick, PI * 1.5, 0.9)
		end
	end
	
	if Tick >= PI * 2 then
		Tick = 0
	end	
	
	camera.CoordinateFrame = camera.CoordinateFrame * 
		CFrame.new(math.cos(Tick) / damping, math.sin(Tick * 2  ) / (damping * 2), x) * 
		CFrame.Angles(0, 0, math.sin(Tick - PI * 1.5) / (damping * 20)) --Set camera CFrame
end