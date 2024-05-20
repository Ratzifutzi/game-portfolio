TweenService = game:GetService("TweenService")

local Cooldown = 4

local LastUse = 0

for k, v : ImageButton in pairs( script.Parent:GetChildren() ) do
	if not v:IsA("ImageButton") then continue end

	v.MouseButton1Click:Connect(function()
		if tick() - LastUse < Cooldown then return end
		LastUse = tick()
		
		require(script.Parent.Modules.Buttons[ v.Name ]).execute()
		
		script.Parent["0_cooldown"].UIGradient.Offset = Vector2.new(1, 0)
		TweenService:Create( script.Parent["0_cooldown"].UIGradient, TweenInfo.new( Cooldown, Enum.EasingStyle.Linear ), {
			Offset = Vector2.new(0, 0)
		} ):Play()
	end)
end