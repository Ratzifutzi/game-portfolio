local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local Root = Players.LocalPlayer.PlayerGui:WaitForChild("Main")

local ContentBox = Root.ContentBox
local ContentWrapper = ContentBox.Wrapper

local module = {}

function module.TransitionTo( frame : Frame )
	ContentWrapper.GroupTransparency = 1
	
	TweenService:Create( ContentBox, TweenInfo.new( 1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out ), {
		Size = frame:GetAttribute("Size")
	} ):Play()
	TweenService:Create( ContentWrapper, TweenInfo.new( .7, Enum.EasingStyle.Quint, Enum.EasingDirection.In ), {
		GroupTransparency = 0
	} ):Play()
	
	for _, v in pairs( ContentWrapper:GetChildren() ) do
		if not v:IsA("Frame") then continue end
		
		v.Visible = false
	end
	frame.Visible = true
end

return module