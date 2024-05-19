-- WARNING: OLD SYSTEM, DOES NOT AGREE WITH NEW HYPER TECH. SCRIPTING STANDARDS!

DoubleJumpGamePassId = 96707850

MarketPlaceService = game:GetService("MarketplaceService")

local UIS = game:GetService("UserInputService")
local char = script.Parent

local hum = char:WaitForChild("Humanoid")

local doubleJumpEnabled = false

OwnsGamepass = game.ReplicatedStorage.Events.fromClient.CheckGamepass:InvokeServer(DoubleJumpGamePassId)

hum.StateChanged:Connect(function(oldState,newState)
	if not OwnsGamepass then return end
	
	if newState == Enum.HumanoidStateType.Jumping then
		if not doubleJumpEnabled then
			wait(.2)
			if hum:GetState() == Enum.HumanoidStateType.Freefall then
				doubleJumpEnabled = true
			end
		end
	elseif newState == Enum.HumanoidStateType.Landed then
		doubleJumpEnabled = false
	end
end)

UIS.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.Space then
		if not OwnsGamepass then return end
		
		if doubleJumpEnabled then
			if hum:GetState() ~= Enum.HumanoidStateType.Jumping then
				hum:ChangeState(Enum.HumanoidStateType.Jumping)
				spawn(function()
					doubleJumpEnabled = false
				end)
			end
		end
	end
end)