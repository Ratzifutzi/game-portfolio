TweenService = game:GetService("TweenService")

Events = game.ReplicatedStorage.Events

Assets = game.ReplicatedStorage.Assets
Sounds = Assets.Sounds

Events.fromServer.NextCheckpointReached.OnClientEvent:Connect(function(checkpoint:Instance)
	Sounds.CheckpointReached:Play()
	
	local _animationPart = Assets.CheckpointAnimation:Clone()
	_animationPart.Parent = workspace
	_animationPart.Size = checkpoint.Size
	_animationPart.CFrame = checkpoint.CFrame
	
	local tween = TweenService:Create(_animationPart, TweenInfo.new(.7, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
		Transparency = 1,
		CFrame = CFrame.new(_animationPart.CFrame * Vector3.new(0, 3, 0) ) * CFrame.fromOrientation(0, checkpoint.Rotation.Y + 90, 0),
		Size = Vector3.new(checkpoint.Size.X + 3, checkpoint.Size.Y, checkpoint.Size.Z + 3)
	}) tween:Play()
	tween.Completed:Connect(function() _animationPart:Destroy() end)
end)