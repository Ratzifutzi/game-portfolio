TweenService = game:GetService("TweenService")

local COLORS = {
	[true] = Color3.new(1, 0, 0),
	[false] = Color3.new(0, 1, 0) 
}

local HitEffect = script.Parent.Parent.HitEffect
local HitColorCorrection = game.Lighting.HitColorCorrection

local HitTweenInfo = TweenInfo.new( .5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)

local PrevHealth = 0

game:GetService("RunService").RenderStepped:Connect(function(dt)
	local humanoid : Humanoid = game.Players.LocalPlayer.Character:WaitForChild( "Humanoid" )
	
	if PrevHealth ~= humanoid.Health then
		script.Parent.TextLabel.UIStroke.Color = Color3.new(1, 1, 1)
		script.Parent.TextLabel.Text = string.format( "%i / %i", humanoid.Health, humanoid.MaxHealth )
		
		TweenService:Create( script.Parent.TextLabel.UIStroke, TweenInfo.new(0.05, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut, 2, true), {
			Color = COLORS[ humanoid.Health < PrevHealth ]
		} ):Play()
		
		TweenService:Create( script.Parent.Pattern.UIGradient, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
			Offset = Vector2.new( humanoid.Health / humanoid.MaxHealth )
		} ):Play()
		
		if PrevHealth > humanoid.Health then
			workspace.Assets.Sounds.Hit:Play()
			
			----------------------
			HitEffect.Size = UDim2.new(1, 0, 1, 0)
			HitEffect.UIStroke.Transparency = 0
			HitEffect.UIStroke.Thickness = 5
			HitColorCorrection.TintColor = Color3.new(1, 0, 0)
			TweenService:Create( HitEffect, HitTweenInfo, {
				Size = UDim2.new(1, 100, 1, 50)
			} ):Play()
			TweenService:Create( HitEffect.UIStroke, HitTweenInfo, {
				Transparency = 1,
				Thickness = 10
			} ):Play()
			TweenService:Create( HitColorCorrection, HitTweenInfo, {
				TintColor = Color3.new(1, 1, 1)
			}):Play()
			----------------------
		end
	end
	PrevHealth = humanoid.Health
end)

