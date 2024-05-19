oldtext = script.Parent.Text

local plr = game.Players.LocalPlayer
local char = plr.Character or plr.ChildAdded:Wait()
local Camera = workspace.CurrentCamera
local TweenService = game:GetService("TweenService")


Camera.CFrame = workspace.CameraA1.CFrame

script.Parent.MouseButton1Click:Connect(function()
	if script.Parent.Parent.Play.TextTransparency == 0 and workspace.DatastoresAvaible.Value == true then
		if script.Parent.Parent.LobbyCreation.Visible == false then
			script.Parent.Parent.LobbyCreation.Visible = false
			script.Parent.Parent.SettingsUI.Visible = false
			script.Parent.Parent.LobbyCreation.Visible = true
		else
			script.Parent.Parent.LobbyCreation.Visible = false
			script.Parent.Parent.SettingsUI.Visible = false
		end
	end
end)

CheckDatastore = function()
	if workspace.DatastoresAvaible.Value == false then
		script.Parent.Text = "<s>PLAY</s>"
		script.Parent.Parent.LobbyCreation.Visible = false
		script.Parent.TextColor3 = Color3.fromRGB(152, 61, 61)
	else
		script.Parent.Text = "PLAY"
		script.Parent.TextColor3 = Color3.fromRGB(163, 163, 163)
	end
end

CheckDatastore()

workspace.DatastoresAvaible.Changed:Connect(function()
	CheckDatastore()
end)

--[[
local clone = workspace.Music:Clone()
clone:Play()
clone.TimePosition = 254
clone.Name = "clone"
clone.Parent = workspace

for i = 0,100 do
	workspace.Music.Volume = 1 - i / 100
	clone.Volume = i / 100
	script.Parent.Parent.Play.TextTransparency = i / 40
	script.Parent.Parent.Settings.TextTransparency = i / 40
	script.Parent.Parent.Credits.TextTransparency = i / 40
	wait(0.01)
end	
wait(1.5)
workspace.Music.Looped = false
clone.Looped = false

script.Parent.Parent.Fullscreen.BackgroundTransparency = 0
]]