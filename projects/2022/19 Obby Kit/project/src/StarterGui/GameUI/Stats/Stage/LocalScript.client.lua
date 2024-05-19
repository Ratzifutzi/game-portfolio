TweenService = game:GetService("TweenService")

Value = game.Players.LocalPlayer:WaitForChild("Data"):WaitForChild("Stage")

function Update(value:number)
	script.Parent.TextLabel.Text = value
	
	script.Parent.TextLabel.TextColor3 = Color3.new(1, 0.0117647, 0.870588)
	TweenService:Create(script.Parent.TextLabel, TweenInfo.new(.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false), {
		TextColor3 = Color3.fromRGB(255, 255, 255)
	}):Play()
	
	script.Parent.Image.ImageColor3 = Color3.new(1, 0.0117647, 0.870588)
	TweenService:Create(script.Parent.Image, TweenInfo.new(.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false), {
		ImageColor3 = Color3.fromRGB(255, 255, 255)
	}):Play()
end

Update(Value.Value)
Value.Changed:Connect( Update )