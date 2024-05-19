

local UserInputService = game:GetService("UserInputService")

-- Shift keys
local key1 = Enum.KeyCode.B
local key2 = Enum.KeyCode.N

-- Return whether left or right shift keys are down
local function IsShiftKeyDown()
	return UserInputService:IsKeyDown(key1) 
end
local function IsShiftKeyDown2()
	return UserInputService:IsKeyDown(key2)
end

-- Handle user input began differently depending on whether a shift key is pressed
local function Input(input, gameProcessedEvent)
	if IsShiftKeyDown() then
		if game.Players.LocalPlayer.CameraMode == Enum.CameraMode.LockFirstPerson then
			game.Players.LocalPlayer.CameraMode = Enum.CameraMode.Classic
			warn("First Person Unlocked")
			game:GetService("UserInputService").MouseIconEnabled = true
			script.beep.PitchShiftSoundEffect.Octave = 0.75
			script.beep:Play()
			wait(script.beep.TimeLength - .2)
			script.beep.PitchShiftSoundEffect.Octave = 1
			script.beep:Play()
			wait(script.beep.TimeLength - .2)
			script.beep:Play()
		else
			game.Players.LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
			warn("First Person Locked")
			game:GetService("UserInputService").MouseIconEnabled = false
			script.beep.PitchShiftSoundEffect.Octave = 1
			script.beep:Play()
			wait(script.beep.TimeLength - .2)
			script.beep.PitchShiftSoundEffect.Octave = .75
			script.beep:Play()
			wait(script.beep.TimeLength - .2)
			script.beep:Play()
		end
	end
	if IsShiftKeyDown2() then
		game.Players.LocalPlayer:Kick("GAME TERMINATED")
	end
end

UserInputService.InputBegan:Connect(Input)

