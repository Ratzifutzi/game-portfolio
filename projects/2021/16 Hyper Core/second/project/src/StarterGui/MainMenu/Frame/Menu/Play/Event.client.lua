workspaceMan = workspace:FindFirstChild(game.Players.LocalPlayer.Name)
local plr = game.Players.LocalPlayer
local char = plr.Character or plr.ChildAdded:Wait()
local Camera = workspace.CurrentCamera

script.Parent.TextButton.MouseButton1Click:Connect(function()

	
	script.Parent.Parent:TweenPosition(UDim2.new(0,0,-1,0), "InOut", "Sine", 1.5)
	
	for i = 0,50 do
		
		wait()
		script.Parent.Parent.Parent.Black.BackgroundTransparency = 1 - i / 20
		script.Parent.Parent.Parent.Black.Visible = true

	end
	
	script.Parent.Parent.Visible = false
	script.Parent.Parent.Parent.Jobs.Visible = true
	
	for i = 0,50 do

		wait()
		script.Parent.Parent.Parent.Black.BackgroundTransparency = i / 20
		script.Parent.Parent.Parent.Black.Visible = true

	end
	
	--[[
	game.Lighting:FindFirstChild("MMblur"):Destroy()
	Camera.CameraType = Enum.CameraType.Custom
	
	-
	
	workspace.Sounds.Ambient.Volume = .5
	workspace.Sounds.LevelUp.Volume = 0.5
	
	
	workspace.MainMenu.PlrInMainMenu.Value = false
	]]
end)