local players = game:GetService("Players")
local plr = players.LocalPlayer

local runService = game:GetService("RunService")

local mouse = plr:GetMouse()

mouse.Move:Connect(function()
	print(mouse.Target)
end)