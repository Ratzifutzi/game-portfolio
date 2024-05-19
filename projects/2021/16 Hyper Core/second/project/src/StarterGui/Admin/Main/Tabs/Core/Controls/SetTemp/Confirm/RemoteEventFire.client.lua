text = script.Parent.Text
script.Parent.MouseButton1Click:Connect(function()
	if game.Workspace.Securety.Admin:FindFirstChild(game.Players.LocalPlayer.Name).Permissions:FindFirstChild(script.Parent.PermissionNeeded.Value).Value == true then
		script.Parent.RemoteEvent.Value:FireServer(script.Parent.Parent.TextBox.Text)
		script.Parent.Parent.TextBox.Text = ""
	else
		script.Parent.Text = "Missing Permission(".. script.Parent.PermissionNeeded.Value..")"
		script.Parent.TextColor3 = Color3.new(0.407843, 0.407843, 0.407843)
		wait(.5)
		script.Parent.TextColor3 = Color3.new(0.407843, 0, 0)
		wait(.5)
		script.Parent.TextColor3 = Color3.new(0.407843, 0.407843, 0.407843)
		wait(.5)
		script.Parent.TextColor3 = Color3.new(0.407843, 0, 0)
		wait(.5)
		script.Parent.TextColor3 = Color3.new(0.407843, 0.407843, 0.407843)
		wait(.5)
		script.Parent.TextColor3 = Color3.new(0.407843, 0, 0)
		wait(.5)
		script.Parent.TextColor3 = Color3.new(0.407843, 0.407843, 0.407843)
		wait(.5)
		script.Parent.TextColor3 = Color3.new(0.407843, 0, 0)
		wait(.5)
		script.Parent.TextColor3 = Color3.new(0.407843, 0.407843, 0.407843)
		wait(.5)
		script.Parent.TextColor3 = Color3.new(0.407843, 0, 0)
		script.Parent.TextColor3 = Color3.new(0.407843, 0.407843, 0.407843)
		script.Parent.Text = text
	end
end)