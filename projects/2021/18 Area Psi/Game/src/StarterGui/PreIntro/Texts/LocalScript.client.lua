
function TypeWriter(obj, text)
	for i = 1, #text,1 do
		wait(.1)
		obj.Text = string.sub(text,1,i)
	end
end



script.Parent.Changed:Connect(function()
	if script.Parent.Visible == true then
		wait(25)
		script.Parent.Visible = false
		local char = script.Parent.Parent.Parent.Parent.Character
		local HumanoidRootPart = char.HumanoidRootPart
		HumanoidRootPart.CFrame = workspace:WaitForChild("TrainStationEvent").Spawn.CFrame
		workspace.CurrentCamera.CFrame = workspace.TrainStationEvent.Spawn.CFrame
		workspace.TrainStationEvent.Shock:Play()
		workspace.TrainStationEvent.TrainStationMusic:Play()
		for i = 0,150 do
			wait()
			game.Lighting.Blur.Size = 15 - i / 10
		end
	end
end)