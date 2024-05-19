wait()

Brightness = game.Lighting.Brightness
pressed = false

script.Parent.MouseButton1Click:Connect(function()
	if pressed == false then
		pressed = true
		game.Lighting.Brightness = 2
	else
		pressed = false
		game.Lighting.Brightness = Brightness
	end
	
end)