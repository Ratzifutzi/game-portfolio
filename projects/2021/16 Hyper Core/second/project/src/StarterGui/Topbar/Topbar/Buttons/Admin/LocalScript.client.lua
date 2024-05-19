script.Parent.MouseButton1Click:Connect(function()
	script.Parent.Parent:TweenPosition(UDim2.new(1, -350, -3, 0), "InOut", "Quad", 1, true)
	script.Parent.Parent.Open.Text = "OPEN"
	script.Parent.Parent.open.Value = false
	
	if workspace.Securety.Admin:FindFirstChild(game.Players.LocalPlayer.Name) then
		
		if workspace.Securety.Admin:FindFirstChild(game.Players.LocalPlayer.Name).LoggedIn.Value == false then
			script.Parent.Parent.Parent.Parent.Parent.Admin.Enabled = true
			for i = 0, 30 do
				script.Parent.Parent.Parent.Parent.Parent.Admin.Login.BackgroundTransparency =1 - i / 30
				wait(0.001)
			end

			wait(.2)

			script.Parent.Parent.Parent.Parent.Parent.Admin.Login.OpenAnimation:Fire()
		else
			script.Parent.Parent.Parent.Parent.Parent.Admin.Enabled = true
			script.Parent.Parent.Parent.Parent.Parent.Admin.Login.Visible = false
			script.Parent.Parent.Parent.Parent.Parent.Admin.Main.Visible = true
			script.Parent.Parent.Parent.Parent.Parent.Admin.Main.Black.Visible = true
			
			for i = 0,60 do
				script.Parent.Parent.Parent.Parent.Parent.Admin.Main.Black.BackgroundTransparency =1- i/60
				wait(.01)
			end
			
			game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
			
			script.Parent.Parent.Parent.Parent.Parent.Admin.Main.Decoration.Visible = true
			script.Parent.Parent.Parent.Parent.Parent.Admin.Main.TabControl.Visible = true
			script.Parent.Parent.Parent.Parent.Parent.Admin.Main.Tabs.Visible = true
			script.Parent.Parent.Parent.Parent.Parent.Admin.Main.BackgroundTransparency = 0
			
			
			
			for i = 0,60 do
				
				script.Parent.Parent.Parent.Parent.Parent.Admin.Main.Black.BackgroundTransparency = i/60
				wait(.01)
			end
		end
		
		
	else
		script.Parent.Parent.Parent.MiddleText.Text = "Acces Denied"
		wait(5)
		script.Parent.Parent.Parent.MiddleText.Text = ""
	end
end)