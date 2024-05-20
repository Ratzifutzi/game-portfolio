TweenService = game:GetService("TweenService")

MUSIC = workspace.Music

MUSIC.MainMusic.Playing = true
MUSIC.BossCountdown.Playing = false

while true do
	
	local pass = false
	repeat 
		timeLeft = workspace.Values.NextFightAt.Value - DateTime.now().UnixTimestamp
		pass = timeLeft - MUSIC.BossCountdown:GetAttribute("Drop") < 0
		
		wait()
	until pass
	
	MUSIC.BossCountdown.TimePosition = MUSIC.BossCountdown:GetAttribute("Drop") - timeLeft
	MUSIC.BossCountdown.Playing = true
	
	local pass = false
	repeat wait() until workspace.Values.NextFightAt.Value - DateTime.now().UnixTimestamp < 0
	
	task.wait( MUSIC.BossCountdown.TimeLength - MUSIC.BossCountdown:GetAttribute("Drop") + 1 )
	
	if game.Players.LocalPlayer.UserData.InBossFight.Value == true then
		game.ReplicatedStorage.Events.CtC.ToggleBlacker:Fire(true)
		
		task.wait(1)
		
		workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
		
		workspace.CurrentCamera.CFrame = workspace.Interactive.BossFight.Keyframes.Cam0.CFrame
		TweenService:Create( workspace.CurrentCamera, TweenInfo.new(5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
			CFrame = workspace.Interactive.BossFight.Keyframes.Cam1.CFrame
		} ):Play()
		
		workspace.Interactive.BossFight.Head.Root.CFrame = workspace.Interactive.BossFight.Keyframes.Spawn0.CFrame
		TweenService:Create( workspace.Interactive.BossFight.Head.Root, TweenInfo.new(8, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
			CFrame = workspace.Interactive.BossFight.Keyframes.Spawn1.CFrame
		} ):Play()
		
		workspace.Growls["Monster Growl"]:Play()
		
		game.ReplicatedStorage.Events.CtC.ToggleBlacker:Fire(false)
		
		game.ReplicatedStorage.Events.StC.BossStarted.OnClientEvent:Wait()
		
		------------------------------------------------
		spawn( function( )
			while workspace.Music.Fight.Playing do
				for i = 1, 5, 1 do
					if not workspace.Music.Fight.Playing then break end
					
					local target = workspace.Interactive.BossFight.Keyframes[ "Cycle" .. tostring(i) ]
					
					TweenService:Create( workspace.Interactive.BossFight.Head.Root, TweenInfo.new(4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
						CFrame = target.CFrame
					} ):Play()
					
					task.wait(4)
				end
			end
		end)
		------------------------------------------------
		
		workspace.Music.Fight.Playing = true
		workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
		
		workspace.Music.Fight.Ended:Wait()
		
		TweenService:Create( workspace.Interactive.BossFight.Head.Root, TweenInfo.new(8, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
			CFrame = workspace.Interactive.BossFight.Keyframes.Spawn0.CFrame
		} ):Play()
		
		workspace.Growls["Roar"]:Play()
		workspace.Music.Victory:Play()
	end
	
	repeat wait() until workspace.Values.NextFightAt.Value - DateTime.now().UnixTimestamp > 0
	
	warn("RESET")
end