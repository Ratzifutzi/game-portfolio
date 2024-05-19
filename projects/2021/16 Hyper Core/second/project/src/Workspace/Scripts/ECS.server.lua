while true do
	wait()
	if workspace.Values.ECS.TriggerECS.Value == true then
		if workspace.Values.ECS.Triggered.Value == false and workspace.Values.MeltdownInProgress.Value == false then
			
			workspace.Values.ECS.Triggered.Value = true
			workspace.Values.ECS.InProgress.Value = true
			workspace.Values.OverrideLights.Value = false
			workspace.Values.OverrideStatusInfo.Value = false
			workspace.Values.Alert.Value = true
			workspace.Sounds.ECSalert:Play()
			workspace.Values.Core.StringStatus.Value = "ECS"
			workspace.Values.Core.StatusColor.Value = Color3.new(1, 0.835294, 0)
			
			wait(workspace.Sounds.ECSalert.TimeLength + .1)
			
			workspace.Sounds.ECSmusic:Play()
			
			workspace.Reactor.WindowScreen.SurfaceGui.Enabled = false
			workspace.Reactor.WindowScreen.ECS.Enabled = true
			workspace.Values.ECS.CoreRoomLockdownTime.Value = 40
			wait(5)
			workspace.Values.CloseWindowBlastdoors.Value = true
			
			wait(35)
			workspace.Values.AirlockCore.Locked.Value = true
			workspace.Values.ECS.Lock.Value = true
		end
	end
end