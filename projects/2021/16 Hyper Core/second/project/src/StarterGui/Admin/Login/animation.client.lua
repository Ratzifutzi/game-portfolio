script.Parent.OpenAnimation.Event:Connect(function()
	game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
	
	script.Parent.title.Visible = true
	script.Parent.sub.Visible = true
	script.Parent.CodeSystem.Visible = true
	
	script.Parent.Visible = true
	script.Parent.CodeSystem.black.Visible = true
	
	script.Parent.title.TextTransparency = 1
	script.Parent.title.Text = "WELCOME ".. string.upper(game.Players.LocalPlayer.Name)
	script.Parent.title.Position = UDim2.new(0.5,0,0.5,0)
	script.Parent.sub.Position = UDim2.new(0.5,0,0.5,0)
	script.Parent.sub.TextTransparency = 1
	script.Parent.title:TweenPosition(UDim2.new(0.5,0,0.04,0), "InOut", "Quad", 2)
	
	script.Parent.CodeSystem.black.BackgroundTransparency = 0
	script.Parent.CodeSystem.black.Visible = true
	script.Parent.CodeSystem.Position = UDim2.new(0.5,0,0.9,0)
	script.Parent.CodeSystem.Confirm.Visible = true
	
	for i = 0, 80 do
		wait(.001)
		script.Parent.title.TextTransparency = 1 - i / 80
	end
	script.Parent.sub:TweenPosition(UDim2.new(0.5,0,0.2,0), "InOut", "Quad", 2)
	for i = 0, 60 do
		wait(.001)
		script.Parent.sub.TextTransparency = 1 - i / 60
	end
	script.Parent.CodeSystem:TweenPosition(UDim2.new(0.5,0,0.5,0), "InOut", "Quad", 2)
	for i = 0, 60 do
		wait(.001)
		script.Parent.CodeSystem.black.BackgroundTransparency  = i / 60
	end
	script.Parent.CodeSystem.black.Visible = false
end)

