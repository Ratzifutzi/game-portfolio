local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

local Busy = false
local Queue = {}

--------------------------------------------
script.Parent.AnchorPoint = Vector2.new(0.5, 0.4)
script.Parent.GroupTransparency = 1
--------------------------------------------
local DialogText = script.Parent.Texts.Text

local function ShowDialog( dialog )
	repeat wait() until not Busy
	Busy = true

	TweenService:Create( script.Parent, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
		AnchorPoint = Vector2.new(0.5, 0),
		GroupTransparency = 0
	} ):Play()

	for k, v in pairs( dialog ) do
		DialogText.Text = v.Text
		for i = 1, #v.Text, 1 do
			DialogText.MaxVisibleGraphemes = i
			task.wait(.01)
		end

		task.wait( v.Duration )
	end

	TweenService:Create( script.Parent, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
		AnchorPoint = Vector2.new(0.5, 0.4),
		GroupTransparency = 1
	} ):Play()
	wait(.75)
	Busy = false
end

ReplicatedStorage.Events.StC.DialogBox.OnClientEvent:Connect(ShowDialog)
ReplicatedStorage.Events.CtC.DialogBox.Event:Connect(ShowDialog)