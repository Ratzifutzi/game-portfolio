local TS = game:GetService("TweenService")

function TypeWriter(obj, text, sleeptime)
	for i = 1, #text,1 do
		wait(sleeptime)
		obj.Text = string.sub(text,1,i)
		obj.shadow.Text = string.sub(text,1,i)
		workspace.TrainStationEvent.Verification.NPC.Head.Face.Texture = workspace.TrainStationEvent.Verification.NPC.Head.Mesh:FindFirstChild("Talking" .. math.random(1,2)).Texture
	end
end

function TypeWriter2(obj, text, sleeptime)
	for i = 1, #text,1 do
		wait(sleeptime)
		obj.Text = string.sub(text,1,i) .. "_"
	end
end

workspace.TrainStationEvent.Verification.PP.ProximityPrompt.Triggered:Connect(function()
	local Screen = workspace.TrainStationEvent.Verification.Screen.SurfaceGui.Verification
	
	Screen.Frame.Frame.Visible = false
	Screen.Frame.TextLabel.Text = ""
	Screen.Keyboard.Visible = true
	Screen.NameToVerify.Text = "_"
	if workspace.TrainStationEvent.Verification.PP.ProximityPrompt.Enabled == true then
		
		local Objects = workspace.TrainStationEvent.Verification
		
		local Module = require(game.Players.LocalPlayer.PlayerGui.FadeService.Module)
		workspace.TrainStationEvent.Verification.PP.ProximityPrompt.Enabled = false
		Module.FadeIn(1,Color3.new(0,0,0))
		
		wait(1)
		
		local CurrentCamera = workspace.CurrentCamera
		repeat CurrentCamera.CameraType = Enum.CameraType.Scriptable until CurrentCamera.CameraType == Enum.CameraType.Scriptable
		CurrentCamera.CFrame = workspace.TrainStationEvent.Verification.Cam1.CFrame
		
		game.Players.LocalPlayer.PlayerGui.Dot.Enabled = false
		
		TS:Create(CurrentCamera, TweenInfo.new(20, Enum.EasingStyle.Sine), {CFrame = Objects.Cam2.CFrame}):Play()
		
		wait()
		
		Module.FadeOut(1)
		
		wait(1)
		
		TypeWriter(Objects.NPC.Head.BillboardGui.TextLabel, "Hello, you know the procedure. Name and fingerprint please.", .05)
		workspace.TrainStationEvent.Verification.NPC.Head.Face.Texture = workspace.TrainStationEvent.Verification.NPC.Head.Mesh.Default.Texture
		
		wait(7)
		
		TypeWriter(Objects.NPC.Head.BillboardGui.TextLabel, "Thanks", .05)
		workspace.TrainStationEvent.Verification.NPC.Head.Face.Texture = workspace.TrainStationEvent.Verification.NPC.Head.Mesh.Default.Texture
		
		wait(1)
		
		TypeWriter(Objects.NPC.Head.BillboardGui.TextLabel, "I will quickly verify your data.", .05)
		workspace.TrainStationEvent.Verification.NPC.Head.Face.Texture = workspace.TrainStationEvent.Verification.NPC.Head.Mesh.Default.Texture

		Screen.Frame.Frame.Visible = false
		Screen.Frame.TextLabel.Text = ""
		Screen.Keyboard.Visible = true
		Screen.NameToVerify.Text = "_"
		
		TS:Create(CurrentCamera, TweenInfo.new(8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {CFrame = Objects.Cam3.CFrame}):Play()
		
		wait(.5)
		
		local SlideToKeyboardAnimation = Objects.NPC.Humanoid:LoadAnimation(Objects.NPC.SlideToKeyboard)
		local SlideToKeyboardIDLEAnimation = Objects.NPC.Humanoid:LoadAnimation(Objects.NPC.SlideToKeyboardIDLE)
		local Type = Objects.NPC.Humanoid:LoadAnimation(Objects.NPC.TypeAnim)
		local SlideArmsBack = Objects.NPC.Humanoid:LoadAnimation(Objects.NPC.SlideArmsBack)
		local SlideArmsBackIDLE = Objects.NPC.Humanoid:LoadAnimation(Objects.NPC.SlideArmsBackIDLE)
		local SlideBackToNORMALSTATE = Objects.NPC.Humanoid:LoadAnimation(Objects.NPC.SlideBackToNORMALSTATE)
		
		
		
		SlideToKeyboardAnimation:Play()
		wait(SlideToKeyboardAnimation.Length)
		SlideToKeyboardIDLEAnimation:Play()
		wait(4)
		SlideToKeyboardIDLEAnimation:Stop()
		Type:Play()
		TypeWriter2(Screen.NameToVerify, game.Players.LocalPlayer.Name, .1)
		wait(1)
		Type:Stop()
		SlideArmsBack:Play()
		
		wait(SlideArmsBack.Length)
		
		SlideArmsBackIDLE:Play()

		Screen.Keyboard.Visible = false
		wait(1)
		TypeWriter2(Screen.Frame.TextLabel, "gdgdsagdgdsa gds gds g dsa gds gdsagdsgdsgdasgdsgdsa gds dgsgdsagdsgdsgdsagdsa gdsagdsdgsadgsadgsahgdgsakhdgsha gdsagdsaghds dgsagdsajhgdakgdsa dggdsahdgasjhkgdsahkdgashdgahsjklgdsajkhdgsahljkdgsahjl dgdgsahjdgsajhlkdgsahjlgjhdsadgsahjvbjndsjhgd dgshgdsjhakgdsjhakhjgkdsajkbvdsajkhhjgfdsa fdshgdhjgdjhkdgsjkhvjkhadshj fdshgdsjkgds dshgdjksalvhbdsajk dshgjkhdsa fdsjhdsjhgdsjjhdslkag")
		wait(1)
		Screen.Frame.Frame.Visible = true
		wait(.05)
		Screen.Frame.Frame.Visible = false
		wait(.05)
		Screen.Frame.Frame.Visible = true
		wait(.05)
		Screen.Frame.Frame.Visible = false
		wait(.05)
		Screen.Frame.Frame.Visible = true
		wait(.05)
		Screen.Frame.Frame.Visible = false
		wait(.5)
		Screen.Frame.Frame.Visible = true
		
		wait(1)

		Screen.Frame.Frame.Visible = false
		Screen.Frame.TextLabel.Text = ""
		Screen.Keyboard.Visible = true
		Screen.NameToVerify.Text = "_"
		
		TS:Create(CurrentCamera, TweenInfo.new(7, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {CFrame = Objects.Cam2.CFrame}):Play()
		
		wait(3.5)
		
		SlideArmsBackIDLE:Stop()
		SlideBackToNORMALSTATE:Play()
		
		TypeWriter(Objects.NPC.Head.BillboardGui.TextLabel, "Thank you, I will now open the door for you.", .05)
		workspace.TrainStationEvent.Verification.NPC.Head.Face.Texture = workspace.TrainStationEvent.Verification.NPC.Head.Mesh.Default.Texture
		
		wait(.5)
		
		Module.FadeIn(1,Color3.new(0,0,0))
		
		wait(1)
		
		repeat CurrentCamera.CameraType = Enum.CameraType.Custom until CurrentCamera.CameraType == Enum.CameraType.Custom
		game.Players.LocalPlayer.PlayerGui.Dot.Enabled = true
		Objects.NPC.Head.BillboardGui.TextLabel.Text = ""
		Objects.NPC.Head.BillboardGui.TextLabel.shadow.Text = ""
		wait()

		Module.FadeOut(1)
		
		wait(2)
		
		workspace.TrainStationEvent.PreIntroDoor2.RemoteOpenEVENT:FireServer()
		
	end
end)