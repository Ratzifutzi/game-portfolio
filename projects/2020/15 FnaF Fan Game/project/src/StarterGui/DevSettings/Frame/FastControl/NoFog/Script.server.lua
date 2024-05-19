wait()

oldfog = game.Lighting.FogEnd
pressed = false

script.Parent.MouseButton1Click:Connect(function()
	if pressed == false then
		pressed = true
		game.Lighting.FogEnd = 100000
	else
		pressed = false
		game.Lighting.FogEnd = oldfog
	end
	
end)