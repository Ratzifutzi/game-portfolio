closed = false

while true do
	wait()
	if workspace.Values.CloseWindowBlastdoors.Value == true and closed == false then
		closed = true
		
		script.Move.PitchShiftSoundEffect.Enabled = false
		script.Beep.Playing = true
		wait(.2)
		script.Move.Playing = true
		for i = workspace.MapDesign.ECS.Left.Position.Z, workspace.MapDesign.ECS.Left.Position.Z + workspace.MapDesign.ECS.Left.Size.Z * 10 do
			workspace.MapDesign.ECS.Right.Position = Vector3.new(workspace.MapDesign.ECS.Right.Position.X, workspace.MapDesign.ECS.Right.Position.Y, workspace.MapDesign.ECS.Right.Position.Z - 0.1)
			workspace.MapDesign.ECS.Left.Position = Vector3.new(workspace.MapDesign.ECS.Left.Position.X, workspace.MapDesign.ECS.Left.Position.Y, workspace.MapDesign.ECS.Left.Position.Z + 0.1)
			wait(.01)
		end
		script.Move.Playing = false
		script.End:Play()
		
		wait(1.5)
		
		script.Move.PitchShiftSoundEffect.Enabled = true
		script.Beep.Playing = true
		wait(.2)
		script.Move.Playing = true
		for i = workspace.MapDesign.ECS.Top.Position.Y, workspace.MapDesign.ECS.Top.Position.Y + workspace.MapDesign.ECS.Top.Size.Y * 10 do
			workspace.MapDesign.ECS.Top.Position = Vector3.new(workspace.MapDesign.ECS.Top.Position.X, workspace.MapDesign.ECS.Top.Position.Y - 0.1, workspace.MapDesign.ECS.Top.Position.Z)
			workspace.MapDesign.ECS.Down.Position = Vector3.new(workspace.MapDesign.ECS.Down.Position.X, workspace.MapDesign.ECS.Down.Position.Y + 0.1, workspace.MapDesign.ECS.Down.Position.Z)
			wait(.01)
		end
		script.Move.Playing = false
		script.End:Play()
		script.Move.PitchShiftSoundEffect.Enabled = false

	end
	
	if workspace.Values.CloseWindowBlastdoors.Value == false and closed == true then
		closed = false
		

		script.Move.PitchShiftSoundEffect.Enabled = true
		script.Beep.Playing = true
		wait(.2)
		script.Move.Playing = true
		for i = workspace.MapDesign.ECS.Top.Position.Y, workspace.MapDesign.ECS.Top.Position.Y + workspace.MapDesign.ECS.Top.Size.Y * 10 do
			workspace.MapDesign.ECS.Top.Position = Vector3.new(workspace.MapDesign.ECS.Top.Position.X, workspace.MapDesign.ECS.Top.Position.Y + 0.1, workspace.MapDesign.ECS.Top.Position.Z)
			workspace.MapDesign.ECS.Down.Position = Vector3.new(workspace.MapDesign.ECS.Down.Position.X, workspace.MapDesign.ECS.Down.Position.Y - 0.1, workspace.MapDesign.ECS.Down.Position.Z)
			wait(.01)
		end
		script.Move.Playing = false
		script.End:Play()
		wait(1.5)
		script.Move.PitchShiftSoundEffect.Enabled = false

		script.Move.PitchShiftSoundEffect.Enabled = false
		script.Beep.Playing = true
		wait(.2)
		script.Move.Playing = true
		for i = workspace.MapDesign.ECS.Left.Position.Z, workspace.MapDesign.ECS.Left.Position.Z + workspace.MapDesign.ECS.Left.Size.Z * 10 do
			workspace.MapDesign.ECS.Right.Position = Vector3.new(workspace.MapDesign.ECS.Right.Position.X, workspace.MapDesign.ECS.Right.Position.Y, workspace.MapDesign.ECS.Right.Position.Z + 0.1)
			workspace.MapDesign.ECS.Left.Position = Vector3.new(workspace.MapDesign.ECS.Left.Position.X, workspace.MapDesign.ECS.Left.Position.Y, workspace.MapDesign.ECS.Left.Position.Z - 0.1)
			wait(.01)
		end
		script.Move.Playing = false
		script.End:Play()


	end
end