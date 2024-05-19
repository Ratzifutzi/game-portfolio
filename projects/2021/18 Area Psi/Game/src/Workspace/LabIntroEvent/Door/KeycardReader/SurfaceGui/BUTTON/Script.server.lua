script.Parent.MouseButton1Click:Connect(function()
	local oldtext = script.Parent.Text
	local oldcol = script.Parent.TextColor3

	script.Parent.Text = "ACCES DENIED"
	script.denied:Play()
	script.Parent.TextColor3 = Color3.new(1,0,0)
	wait(5)
	script.Parent.Text = oldtext
	script.Parent.TextColor3 = oldcol
end)

--[[ ONLY REQ. IF BUTTON CLONE

script.Parent.Parent.Parent.Parent.Part.SurfaceGui.BUTTON.Changed:Connect(function()
	script.Parent.Text = script.Parent.Parent.Parent.Parent.Part.SurfaceGui.BUTTON.Text
	script.Parent.TextColor3 = script.Parent.Parent.Parent.Parent.Part.SurfaceGui.BUTTON.TextColor3
end)

]]--