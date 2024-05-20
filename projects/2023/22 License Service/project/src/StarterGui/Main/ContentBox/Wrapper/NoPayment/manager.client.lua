local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Transitions = require(game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main"):WaitForChild("manager"):WaitForChild("Transitions"))

local Root = script.Parent

Root.Reconnect.MouseButton1Click:Connect(function()
	Transitions.TransitionTo( Root.Parent.Loading )
	
	ReplicatedStorage.Events.CtS.Reconnect:FireServer()
end)