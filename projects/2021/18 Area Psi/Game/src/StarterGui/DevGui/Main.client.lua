
workspace.DevConsole.UserLevel.Changed:Connect(function()
	local RankIns = workspace.DevConsole.PermissionGroups:FindFirstChild(workspace.DevConsole.UserLevel.Value)
	if RankIns:FindFirstChild("AccessUI") then
		script.Parent.Open.Visible = true
	else
		script.Parent.Open.Visible = false
	end
end)

local RankIns = workspace.DevConsole.PermissionGroups:FindFirstChild(workspace.DevConsole.UserLevel.Value)

if RankIns:FindFirstChild("AccessUI") then
	script.Parent.Open.Visible = true
else
	script.Parent.Open.Visible = false
end

local UserInputService = game:GetService("UserInputService")

if not (UserInputService.KeyboardEnabled) then
	script.Parent.Open.Info.Visible = false
end

TS = game:GetService("TweenService")
TI = TweenInfo.new(3.5, Enum.EasingStyle.Sine)

tween = TS:Create(script.Parent.Open.Info, TI, {
	TextTransparency = 0.75
})

wait(15)
tween:Play()