script.Parent.Parent.TextBox.Changed:Connect(function()
	local text = script.Parent.Parent.TextBox.Text
	if tonumber(text) then
		if #text == 6 then
			script.Parent.TextColor3 = Color3.new(0.72549, 0.72549, 0.72549)
		else
			script.Parent.TextColor3 = Color3.new(0.290196, 0.290196, 0.290196)
		end
	else
		script.Parent.TextColor3 = Color3.new(0.290196, 0.290196, 0.290196)
	end
end)

ac = false
attmps = 1
script.Parent.MouseButton1Click:Connect(function()
	if ac == false then
		ac = true
		local text = script.Parent.Parent.TextBox.Text
		if tonumber(text) then
			if #text == 6 then
				script.Parent.Text = "Please Wait..."
				script.Parent.Parent.Parent.Loading.Visible = true
				wait(3)
				if workspace.Securety.Admin:FindFirstChild(game.Players.LocalPlayer.Name) then
					script.Parent.Text = "User tagged"
					wait(2)
					if workspace.Securety.Admin:FindFirstChild(game.Players.LocalPlayer.Name).Code.Value == script.Parent.Parent.TextBox.Text then
						script.Parent.Text = "Access granted"
						wait(2)
						script.Parent.Text = "Logging in"
						workspace.Securety.Admin:FindFirstChild(game.Players.LocalPlayer.Name).LoggedIn.Value = true
						wait(2)
						
						script.Parent.Parent.black.Visible = true
						for i = 0, 60 do
							wait(.001)
							script.Parent.Parent.black.BackgroundTransparency = 1 - i / 60
							script.Parent.Parent.Parent.title.TextTransparency = i / 60
							script.Parent.Parent.Parent.sub.TextTransparency = i / 60
							script.Parent.Parent.Parent.Loading.ImageTransparency = i / 60
						end
						
						script.Parent.Visible = false
						script.Parent.Parent.Parent.Parent.Main.Visible = true
						
						script.Parent.Parent.Parent.Parent.Main.Black.Visible = true
						
						for i = 0, 60 do
							wait(.001)
							script.Parent.Parent.Parent.Parent.Main.Black.BackgroundTransparency = i / 60
						end
						
						script.Parent.Parent.Parent.Parent.Main.Black.Visible = false
						
					else
						if attmps <= 3 then
							script.Parent.Text = "Code denied"
							script.Parent.Parent.Parent.Loading.Visible = false
							script.Parent.Parent.TextBox.Text = ""
							ac = false
							attmps = attmps + 1
						else
							game.Players.LocalPlayer:Kick("Acces Denied")
						end
					end
				else
					game.Players.LocalPlayer:Kick("Acces Denied")
				end
			end
		end
		
	end
end)