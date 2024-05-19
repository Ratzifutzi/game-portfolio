local module = {}

function module.record (character:Instance)
	local humanoid:Humanoid = character:WaitForChild("Humanoid")
	local rootPart:Part = character:WaitForChild("HumanoidRootPart")
	
	local startTick = tick()
	local recordedData = {}
	
	game:GetService("RunService").Heartbeat:Connect(function()
		recordedData[tick() - startTick] = rootPart.Position
	end)
end

return module
