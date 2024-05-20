ReplicatedStorage = game:GetService("ReplicatedStorage")

local PROMPT = script.Parent:WaitForChild("PromptPart"):WaitForChild("Prompt")

PROMPT.Triggered:Connect(function()
	ReplicatedStorage.Events.CtC.ToggleBlacker:Fire( true )
	
	task.wait(0.75)
	local res = ReplicatedStorage.Functions.CtS.EnterArena:InvokeServer()
	task.wait(0.75)
	
	ReplicatedStorage.Events.CtC.ToggleBlacker:Fire( false )
end)