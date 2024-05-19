
local plr = game.Players.LocalPlayer
local char = plr.Character or plr.ChildAdded:Wait()
local Camera = workspace.CurrentCamera


repeat wait()
	Camera.CameraType = Enum.CameraType.Scriptable
until Camera.CameraType == Enum.CameraType.Scriptable

local TweenService = game:GetService("TweenService")
	
Camera.CFrame = workspace.Camera.CFrame


local TweenService = game:GetService("TweenService")

local Panel = workspace.Camera
local PanelRoot = Panel

local PanelSlideInfo = TweenInfo.new(0, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut) -- Let's use all defaults here

local PanelSlideTween = TweenService:Create(PanelRoot, PanelSlideInfo, {
	CFrame = workspace.CameraA1.CFrame
})

PanelSlideTween:Play()

workspace.Music:Play()

wait(10)

while true do
	wait()
	local TweenService = game:GetService("TweenService")

	local Panel = workspace.Camera
	local PanelRoot = Panel

	local PanelSlideInfo = TweenInfo.new(20, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut) -- Let's use all defaults here

	local PanelSlideTween = TweenService:Create(PanelRoot, PanelSlideInfo, {
		CFrame = workspace.CameraA2.CFrame
	})

	PanelSlideTween:Play()
	
	wait(20 + 5)
	
	local TweenService = game:GetService("TweenService")

	local Panel = workspace.Camera
	local PanelRoot = Panel

	local PanelSlideInfo = TweenInfo.new(20, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut) -- Let's use all defaults here

	local PanelSlideTween = TweenService:Create(PanelRoot, PanelSlideInfo, {
		CFrame = workspace.CameraA3.CFrame
	})

	PanelSlideTween:Play()

	wait(20 + 5)
	
	wait()
	local TweenService = game:GetService("TweenService")

	local Panel = workspace.Camera
	local PanelRoot = Panel

	local PanelSlideInfo = TweenInfo.new(20, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut) -- Let's use all defaults here

	local PanelSlideTween = TweenService:Create(PanelRoot, PanelSlideInfo, {
		CFrame = workspace.CameraA2.CFrame
	})

	PanelSlideTween:Play()

	wait(20 + 5)
	
	wait()
	local TweenService = game:GetService("TweenService")

	local Panel = workspace.Camera
	local PanelRoot = Panel

	local PanelSlideInfo = TweenInfo.new(20, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut) -- Let's use all defaults here

	local PanelSlideTween = TweenService:Create(PanelRoot, PanelSlideInfo, {
		CFrame = workspace.CameraA1.CFrame
	})

	PanelSlideTween:Play()

	wait(20 + 5)
end