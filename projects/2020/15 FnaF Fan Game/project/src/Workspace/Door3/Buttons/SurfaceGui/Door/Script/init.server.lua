openval = false
door = script.Parent.Parent.Parent.Parent.Door
closedtime = 0

function open()
	openval = true
	door.Transparency = 1
	door.Texture.Transparency = 1
	door.Texture2.Transparency = 1
	door.CanCollide = false
	script.SoundDoor:Play()
end

function close()
	openval = false
	door.Transparency = 0
	door.Texture.Transparency = 0
	door.Texture2.Transparency = 0
	door.CanCollide = true
	script.SoundDoor:Play()
end

open()

script.Parent.MouseButton1Click:Connect(function()
	if workspace.Values.FuseLife.Value > 1 then
		if openval == false then
			open()
			wait(.4)
		else
			close()
			
			wait(.4)
		end
	end
end)

while true do
	if workspace.Values.FuseLife.Value <= 1 then
		open()
		script.SoundDoor:Stop()
		script.Parent.BackgroundColor3 = Color3.new(0.329412, 0.329412, 0.329412)
	else
		script.Parent.BackgroundColor3 = Color3.new(0, 0.333333, 0)
	end
	if openval == false then
		closedtime = closedtime + 0.001
		if closedtime >= 1.5 then
			closedtime = 0
			workspace.Values.FuseLife.Value = workspace.Values.FuseLife.Value - 1
		end
	else
		closedtime = 0
	end
	wait()
end