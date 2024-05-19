tpservice = game:GetService("TeleportService")

--IMPORTS
Loading = true

StatusString = workspace.Values.Core.StringStatus
StatusColor = workspace.Values.Core.StatusColor
Temp = workspace.Values.Core.Temp
Cooling = workspace.Values.Core.Cooling
Lasers = workspace.Values.Core.Lasers
MeltdownWarningTemp = workspace.Values.Core.Configuration.MeltdownAlertTemp
MeltdownTemp = workspace.Values.Core.Configuration.MeltdownTemp
FreezedownWarningTemp = workspace.Values.Core.Configuration.FreezedownAlertTemp
FreezedownTemp = workspace.Values.Core.Configuration.FreezedownTemp
Loading = workspace.Values.Core.Loading
UserControlLocked = workspace.Values.Core.UserControlLocked
CoreColor = workspace.Values.Core.Color

AlertLights = workspace.Values.Alert
AlertLihtsBlinking = workspace.Values.AlertBlink
Blackout = workspace.Values.Blackout

CoolingPower = workspace.Values.Core.Cooling.CoolingPower

TempMultiplikator = workspace.Values.Core.TempMultiplicator
TempPerSec = workspace.Values.Core.TempPerSec

Loading.Value = false
StatusColor.Value = Color3.new(0, 1, 0)
StatusString.Value = "STABLE"


PlayedFreezedownWarning = false
PlayedMeltdownWarning = false

TimeRemain = workspace.Values.TimeRemain

MeltdownInProgress = workspace.Values.MeltdownInProgress

if TempMultiplikator.Value == 0 then
	warn("Temp-Multiplikator is 0! ignoring...")
end

function PlayFreezedownWarning()
	if PlayedFreezedownWarning == false then
		AlertLights.Value = true
		AlertLihtsBlinking.Value = true

		workspace.Sounds.Alert:Play()
		wait(2.1)
		workspace.Sounds.Alert:Play()
		wait(2.1)
		if workspace.Values.OverrideLights.Value == true then
			AlertLihtsBlinking.Value = false
		end
		workspace.Sounds.FreezedownWarning:Play()
		wait(4.5)
		workspace.Sounds.FreezedownWarning:Stop()
	end
end

function PlayMeltdownWarning()
	if PlayedMeltdownWarning == false then
		AlertLights.Value = true
		AlertLihtsBlinking.Value = true
		workspace.Sounds.Alert:Play()
		wait(2.1)
		workspace.Sounds.Alert:Play()
		wait(2.1)
		AlertLihtsBlinking.Value = false
		wait(.3)
		workspace.Sounds.MeltdownWarning:Play()
		wait(4.5)
		workspace.Sounds.MeltdownWarning:Stop()
	end
end

function PlayMeltdownEvent()
	AlertLights.Value = true
	AlertLihtsBlinking.Value = true
	workspace.Sounds.Alert:Play()
	wait(2.1)
	workspace.Sounds.Alert:Play()
	wait(2.3)
	workspace.Sounds.MeltdownLastWarning:Play()
	
	wait(workspace.Sounds.MeltdownLastWarning.TimeLength + .2)
	
	Lasers.ActiveLaserCount.Value = 0
	Cooling.CoolingPower.Value = 0
	TempMultiplikator.Value = 0
	Temp.Value = 1000000
	
	workspace.Sounds.Meltdown:Play()
	script.Countdown.Parent = workspace.Reactor.WindowScreen
	workspace.Reactor.WindowScreen.SurfaceGui.Parent = script
	workspace.Values.TimeRemain.Value = math.floor(workspace.Sounds.Meltdown.TimeLength + .5)

	while true do
		wait()
		if TimeRemain.Value == 13 then
			workspace.Sounds.Countdown:Play()
		end
		
		if TimeRemain.Value == 0 then
			wait(1)
			workspace.BlackEndText.Text.Value = "The Facility has been destroyed."
			workspace.BlackEndText.Send.Value = true
			wait(5)
			workspace.BlackEndText.Hide.Value = true
			for i, v in pairs(game:GetService("Players"):GetPlayers()) do
				v:Kick("Server closed. After-Meltdown-Event is work in progress. You can rejoin the Game to play again.")
			end
		end
	end
	
	
end

while true do
	wait(5)
	Temp.Value = Temp.Value + TempPerSec.Value * TempMultiplikator.Value
	TempPerSec.Value = math.random(2,7)
	PowerPoints = math.random(5,20)
	TempPerSec.Value = TempPerSec.Value + PowerPoints * Lasers.ActiveLaserCount.Value + math.random(0,1)
	TempPerSec.Value = TempPerSec.Value - PowerPoints * 2 * Cooling.CoolingPower.Value
	workspace.Values.Core.PowerPoints.Value = PowerPoints
	
	if Temp.Value <= FreezedownWarningTemp.Value then
		PlayFreezedownWarning()
		PlayedFreezedownWarning = true
	else
		PlayedFreezedownWarning = false
	end
	
	if Temp.Value >= MeltdownWarningTemp.Value then
		PlayMeltdownWarning()
		PlayedMeltdownWarning = true
	else
		PlayedMeltdownWarning = false
	end
	
	
	if PlayedFreezedownWarning == true then
		if workspace.Values.OverrideStatusInfo.Value == true then
			StatusColor.Value = Color3.new(0, 0.984314, 1)
			StatusString.Value = "FREEZEDOWN ALERT"
		end
		CoreColor.Value = Color3.new(0, 0.180392, 1)
		if Temp.Value < FreezedownTemp.Value then
			if workspace.Values.OverrideStatusInfo.Value == true then
				StatusColor.Value = Color3.new(1, 0, 0)
				StatusString.Value = "FREEZEDOWN"
			end
			CoreColor.Value = Color3.new(0.392157, 0, 0.670588)
			workspace.Sounds.Ambient.Playing = false
		end
	else
		if PlayedMeltdownWarning == true then
			if workspace.Values.OverrideStatusInfo.Value == true then
				StatusColor.Value = Color3.new(0.603922, 0, 0)
				StatusString.Value = "MELTDOWN ALERT"
			end
			CoreColor.Value = Color3.new(1, 0.615686, 0)
			if Temp.Value > MeltdownTemp.Value then
				if workspace.Values.OverrideStatusInfo.Value == true then
					StatusColor.Value = Color3.new(1, 0, 0)
					StatusString.Value = "MELTDOWN"
				end
				CoreColor.Value = Color3.new(1, 0, 0)
				if MeltdownInProgress.Value == false then
					MeltdownInProgress.Value = true
					workspace.Sounds.Ambient.Playing = false
					PlayMeltdownEvent()
				end
			end
		else
			if workspace.Values.OverrideStatusInfo.Value == true then
				StatusColor.Value = Color3.new(0, 1, 0)
				CoreColor.Value = Color3.new(0, 0.984314, 1)
				StatusString.Value = "STABLE"
			end
			if workspace.Values.OverrideLights.Value == true then
				AlertLights.Value = false
				AlertLihtsBlinking.Value = false
			end
			workspace.Sounds.Ambient.Playing = true
		end
	end
end