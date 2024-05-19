MarketplaceService = game:GetService("MarketplaceService")
TweenService = game:GetService("TweenService")
LocalPlayer = game.Players.LocalPlayer

function UpdateVisiblity (value)
	-- TODO Use Configuration
	if value >= 5 then
		TweenService:Create(script.Parent, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
			Position = UDim2.new(0.919, 0, 0.832)
		}):Play()
	end

	if value == 0 then
		TweenService:Create(script.Parent, TweenInfo.new(.2, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut), {
			Position = UDim2.new(1.1, 0, 0.832)
		}):Play()
	end
end

LocalPlayer["Data"]["DeathsThisStage"].Changed:Connect(UpdateVisiblity)
UpdateVisiblity(LocalPlayer["Data"]["DeathsThisStage"].Value)


-- Animations

script.Parent.MouseEnter:Connect(function()
	TweenService:Create(script.Parent, TweenInfo.new(.2), {
		Rotation = 10,
		Size = UDim2.new(0.089, 10, 0.185, 10)
	}):Play()
	
	TweenService:Create(script.Parent.UIStroke, TweenInfo.new(0.2), {
		Thickness = 4,
		Color = Color3.fromHex("#ffffff")
	}):Play()
end)

script.Parent.MouseLeave:Connect(function()
	TweenService:Create(script.Parent, TweenInfo.new(.2), {
		Rotation = 0,
		Size = UDim2.new(0.089, 0, 0.185, 0)
	}):Play()
	
	TweenService:Create(script.Parent.UIStroke, TweenInfo.new(0.2), {
		Thickness = 3,
		Color = Color3.fromHex("#c3c3c3")
	}):Play()
end)

script.Parent.Button.MouseButton1Click:Connect(function()
	MarketplaceService:PromptProductPurchase(game.Players.LocalPlayer, 1324870520)
end)