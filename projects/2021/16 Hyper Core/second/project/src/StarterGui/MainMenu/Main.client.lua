script.Parent.Frame.Loading.Visible = true
workspace.MainMenu.PlrInMainMenu.Value = true
script.Parent.Frame.Menu.Visible = false
script.Parent.Frame.Settings.Visible = false
workspace.Sounds.Ambient.Volume = 0
workspace.Sounds.LevelUp.Volume = 0

wait(2)

script.Parent.Frame.Intro.Visible = true
workspace.Sounds.NewIntroSound:Play()
wait(.45)
script.Parent.Frame.Intro.ImageLabel.a.Visible = false
wait(1.3)
script.Parent.Frame.Intro.ImageLabel.b.Visible = false
wait(1.6)
script.Parent.Frame.Intro.ImageLabel.c.Visible = false
wait(1.5)
script.Parent.Frame.Intro.ImageLabel.ImageColor3 = Color3.new(1, 1, 1)

repeat wait()
	
until workspace.Sounds.NewIntroSound.TimePosition == 0

script.Parent.Frame.Intro.ImageLabel.Visible = false

wait(.5)

script.Parent.Frame.Intro.Visible = false
script.Parent.Frame.Loading.Visible = false
workspace.Sounds.MMM:Play()
script.Parent.Frame.Menu.Visible = true


blur = Instance.new("BlurEffect")
blur.Parent = game.Lighting
blur.Name = "MMblur"

local plr = game.Players.LocalPlayer
local char = plr.Character or plr.ChildAdded:Wait()
local Camera = workspace.CurrentCamera


repeat wait()
	Camera.CameraType = Enum.CameraType.Scriptable
until Camera.CameraType == Enum.CameraType.Scriptable

Camera.CFrame = workspace.MainMenu.MainMenuCam1.CFrame

workspace.MainMenu.PlrInMainMenu.Value = true

oldnum = 0
num = 0

cams = workspace.MainMenu.Cams.Value

while workspace.MainMenu.PlrInMainMenu.Value == true do
	num = math.random(1, cams)
	wait()
	while num == oldnum do
		num = math.random(1, cams)
		wait()
	end
	
	oldnum = num
	Camera.CFrame = workspace.MainMenu:FindFirstChild("MainMenuCam".. num).CFrame
	wait(5)
end