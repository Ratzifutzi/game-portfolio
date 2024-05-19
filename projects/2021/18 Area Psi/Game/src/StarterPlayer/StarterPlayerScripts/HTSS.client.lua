--[[
local userInput = game:GetService('UserInputService')
local Players = game:GetService('Players')
local TS = game:GetService("TweenService")

local Character = game.Players.LocalPlayer.Character
local sprintDur = 6 -- seconds
local IsSprinting = false
startTime = nil
local sprintLock = false

userInput.InputBegan:Connect(function(Input,Gameprocefnaf)
	print(userInput:IsKeyDown(Enum.KeyCode.LeftShift))
	if userInput:IsKeyDown(Enum.KeyCode.LeftShift) then
		warn(userInput:IsKeyDown(Enum.KeyCode.LeftShift))
		if IsSprinting == false then
			IsSprinting = true
			warn("--" .. tostring(IsSprinting))
			startTime = tick()
			Character = game.Players.LocalPlayer.Character
			TS:Create(Character.Humanoid, TweenInfo.new(0.75, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
				WalkSpeed = Character.Humanoid.WalkSpeed * 1.5
			}):Play()
			repeat wait()
				if startTime - tick() <= sprintDur - sprintDur - sprintDur + 2 and startTime - tick() >= sprintDur - sprintDur - sprintDur then
					print("KEUCHEN!!!")
				elseif startTime - tick() < sprintDur - sprintDur - sprintDur and startTime - tick() >= -sprintDur - 2 then
					print("stop running")
					if userInput:IsKeyDown(Enum.KeyCode.LeftShift) == false or userInput:IsKeyDown(Enum.KeyCode.RightShift) == false then
						if IsSprinting == true then
							IsSprinting = false
							TS:Create(Character.Humanoid, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
								WalkSpeed = Character.Humanoid.WalkSpeed / 1.5
							}):Play()
						end	
					end
				elseif startTime - tick() < -sprintDur - 2 then
					print("very slow... :,(")
					if IsSprinting == true then
						IsSprinting = false
						TS:Create(Character.Humanoid, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
							WalkSpeed = game.StarterPlayer.CharacterWalkSpeed / 1.5
						}):Play()
					end	
				end
			until userInput:IsKeyDown(Enum.KeyCode.LeftShift) == false
		end
	end
end)

userInput.InputEnded:Connect(function(Input,GPEFNAF)
	print(userInput:IsKeyDown(Enum.KeyCode.LeftShift))
	if userInput:IsKeyDown(Enum.KeyCode.LeftShift) == false then
		if IsSprinting == true then
			IsSprinting = false
			TS:Create(Character.Humanoid, TweenInfo.new(0.75, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
				WalkSpeed = Character.Humanoid.WalkSpeed / 1.5
			}):Play()
			if startTime - tick() < -sprintDur - 2 then
				sprintLock = true
				print(sprintLock)
				
			end
		end	
	end
end)
]]