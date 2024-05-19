workspaceMan = workspace:FindFirstChild(game.Players.LocalPlayer.Name)
local plr = game.Players.LocalPlayer
local char = plr.Character or plr.ChildAdded:Wait()
local Camera = workspace.CurrentCamera

script.Parent.TextButton.MouseButton1Click:Connect(function()
	workspace.Jobs:FindFirstChild(script.Parent.Name):FindFirstChild("AddUser"):FireServer()
	
	for i = 0,50 do
		workspace.Sounds.MMM.Volume = 1 - i / 20
		wait()
		script.Parent.Parent.Parent.Black.BackgroundTransparency = 1 - i / 20
		script.Parent.Parent.Parent.Black.Visible = true
	end
	
	
	wait(1)
	game.Lighting:FindFirstChild("MMblur"):Destroy()
	Camera.CameraType = Enum.CameraType.Custom
	script.Parent.Parent.Visible = false
	
	for i = 0,50 do

		wait()
		script.Parent.Parent.Parent.Black.BackgroundTransparency = i / 20
		script.Parent.Parent.Parent.Black.Visible = true

	end
	
	workspace.Sounds.Ambient.Volume = .5
	workspace.Sounds.LevelUp.Volume = 0.5


	workspace.MainMenu.PlrInMainMenu.Value = false
end)