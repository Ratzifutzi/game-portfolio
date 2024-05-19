EnablePart = script.EnablePart.Value
DisablePart = script.DisablePart.Value

EnablePart.Touched:Connect(function()
	workspace.Values.CoreSoundsMuted.Value = false
	print("UnMuted")
end)

DisablePart.Touched:Connect(function()
	workspace.Values.CoreSoundsMuted.Value = true
	print("Muted")
end)

while true do
	wait()
	if workspace.Values.CoreSoundsMuted.Value == true then
		local Sounds = workspace.Sounds
		Sounds.Event.break_01.Volume = 0
		Sounds.Event.explosion_01.Volume = 0
		Sounds.Event.explosion_02.Volume = 0
		Sounds.Event.explosion_03.Volume = 0
		workspace.Sounds.Event.explosion_04.Volume = 0
		workspace.Sounds.Event.glass_break_01.Volume = 0
		workspace.Sounds.Event.metal_break_01.Volume = 0
		workspace.Sounds.Event.metal_break_02.Volume = 0
		if workspace.Values.MeltdownInProgress.Value == false then
			workspace.Reactor.WindowScreen.SurfaceGui.CoolingControl.OpenVent.Script.sound.Volume = 0
			workspace.Reactor.WindowScreen.SurfaceGui.CoolingControl.powerButton.Script.Alert.Volume = 0
		else
			while not workspace.Reactor.MainController.SurfaceGui do
				wait()
				workspace.Reactor.MainController.SurfaceGui.CoolingControl.powerButton.Script.Alert.Volume = 0
				workspace.Reactor.MainController.SurfaceGui.CoolingControl.OpenVent.Script.sound.Volume = 0
			end
		end
	else
		local Sounds = workspace.Sounds
		Sounds.Event.break_01.Volume = 2
		Sounds.Event.explosion_01.Volume = 02
		Sounds.Event.explosion_02.Volume = 02
		Sounds.Event.explosion_03.Volume = 02
		workspace.Sounds.Event.explosion_04.Volume = 02
		workspace.Sounds.Event.glass_break_01.Volume = 02
		workspace.Sounds.Event.metal_break_01.Volume = 02
		workspace.Sounds.Event.metal_break_02.Volume = 02
		if workspace.Values.MeltdownInProgress.Value == false then
			workspace.Reactor.WindowScreen.SurfaceGui.CoolingControl.OpenVent.Script.sound.Volume = 1
			workspace.Reactor.WindowScreen.SurfaceGui.CoolingControl.powerButton.Script.Alert.Volume = 1
		else
			while not workspace.Reactor.MainController.SurfaceGui do
				workspace.Reactor.MainController.SurfaceGui.CoolingControl.powerButton.Script.Alert.Volume = 1
				workspace.Reactor.MainController.SurfaceGui.CoolingControl.OpenVent.Script.sound.Volume = 1
				wait()
			end
		end
		
	end
end