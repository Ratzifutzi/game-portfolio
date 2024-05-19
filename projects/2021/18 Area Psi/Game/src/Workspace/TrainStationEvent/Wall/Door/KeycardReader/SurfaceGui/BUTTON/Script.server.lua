script.Parent.MouseButton1Click:Connect(function()
	if workspace.PlayerClearence.Value >= script.Parent.Parent.Parent.Parent.Clearence.Value then
		if script.Parent.Parent.Parent.Parent.Openv.Moving.Value == false then
			if script.Parent.Parent.Parent.Parent.Openv.Value == false then
				script.Parent.Parent.Parent.Parent.Open:Fire()
			else
				script.Parent.Parent.Parent.Parent.Close:Fire()
			end
		end
	else
		local oldtext = script.Parent.Text
		local oldcol = script.Parent.TextColor3
		
		script.Parent.Text = "ACCES DENIED"
		script.denied:Play()
		script.Parent.TextColor3 = Color3.new(1,0,0)
		wait(5)
		script.Parent.Text = oldtext
		script.Parent.TextColor3 = oldcol
	end
end)

--[[ ONLY REQ. IF BUTTON CLONE

script.Parent.Parent.Parent.Parent.Part.SurfaceGui.BUTTON.Changed:Connect(function()
	script.Parent.Text = script.Parent.Parent.Parent.Parent.Part.SurfaceGui.BUTTON.Text
	script.Parent.TextColor3 = script.Parent.Parent.Parent.Parent.Part.SurfaceGui.BUTTON.TextColor3
end)

]]--