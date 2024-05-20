local module = {}

MUSIC = workspace.Music

local PatternModule = require( game.ServerScriptService.Boss.Patterns )

local function SendMessageToFighters ( dialogToSend )
	for k, v in pairs( game.Players:GetChildren() ) do
		if not v:WaitForChild("UserData"):WaitForChild("InBossFight").Value then continue end
		
		game.ReplicatedStorage.Events.StC.DialogBox:FireClient( v, dialogToSend )
	end
end

module["execute"] = function()
	while true do
		local pass = false
		repeat 
			local timeLeft = workspace.Values.NextFightAt.Value - DateTime.now().UnixTimestamp
			pass = timeLeft - MUSIC.BossCountdown:GetAttribute("Drop") < 0

			wait()
		until pass
		
		local pass = false
		repeat wait() until workspace.Values.NextFightAt.Value - DateTime.now().UnixTimestamp < 0
		
		task.wait( MUSIC.BossCountdown.TimeLength - MUSIC.BossCountdown:GetAttribute("Drop") + 1 )
		task.wait(10)
		
		game.ReplicatedStorage.Events.StC.BossStarted:FireAllClients()
		workspace.Values.PatternChargeTime.Value = 4
		workspace.Map.BossFight.plataform.Size = Vector3.new( 150, 8.106, 150 )
		
		SendMessageToFighters( {
			{
				["Text"] = "Warning! Avoid the <font color=\"rgb(255,0,0)\">red zones</font>, they will <font color=\"rgb(255,0,0)\">damage</font> you!",
				["Duration"] = 5
			},
			{
				["Text"]= "If you get <font color=\"rgb(255,0,0)\">killed</font>, you will have to <font color=\"rgb(255,0,0)\">restart</font>!",
				["Duration"] = 4
			}
		} )
		
		local speedUpTween = game:GetService("TweenService"):Create( workspace.Values.PatternChargeTime, TweenInfo.new(MUSIC.Fight.TimeLength / 2, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
			Value = 0.8
		} ) speedUpTween:Play()
		speedUpTween.Completed:Once(function()
			game:GetService("TweenService"):Create( workspace.Map.BossFight.plataform, TweenInfo.new( MUSIC.Fight.TimeLength / 2, Enum.EasingStyle.Linear ), {
				Size = Vector3.new( 75, 8.106, 75 )
			} ):Play()
		end)
		
		speedUpTween.Completed:Once(function()
			SendMessageToFighters( {
				{
					["Text"] = "Half way through! Now the hard part...",
					["Duration"] = 2
				},
				{
					["Text"]= "Just hold on! You can do it!",
					["Duration"] = 3
				}
			} )
		end)
		
		local loopStarted = tick()
		repeat
			PatternModule.Spawn( game.ReplicatedStorage.BossPatterns:GetChildren()[ math.random(1, #game.ReplicatedStorage.BossPatterns:GetChildren()) ] )
		until tick() - loopStarted > MUSIC.Fight.TimeLength
		
		warn("ENDED")
		repeat wait() until workspace.Values.NextFightAt.Value - DateTime.now().UnixTimestamp > 0
		warn("RESET")
	end
end

return module
