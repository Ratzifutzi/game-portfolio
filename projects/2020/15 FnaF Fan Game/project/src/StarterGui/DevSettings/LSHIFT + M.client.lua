

local UserInputService = game:GetService("UserInputService")

-- Shift keys
local key1 = Enum.KeyCode.LeftShift
local key2 = Enum.KeyCode.M

-- Return whether left or right shift keys are down
local function IsShiftKeyDown()
	return UserInputService:IsKeyDown(key1) and UserInputService:IsKeyDown(key2)
end

-- Handle user input began differently depending on whether a shift key is pressed
local function Input(input, gameProcessedEvent)
	if IsShiftKeyDown() then
		if script.Parent.Enabled == false then
			script.Parent.Enabled = true
		else
			script.Parent.Enabled = false
		end
	end
end

UserInputService.InputBegan:Connect(Input)

