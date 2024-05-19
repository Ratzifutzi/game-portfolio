script.Parent.Enabled = true

local UserInputService = game:GetService("UserInputService")

if not (UserInputService.KeyboardEnabled) then
	script.Parent.Enabled = false
end
script:Destroy()