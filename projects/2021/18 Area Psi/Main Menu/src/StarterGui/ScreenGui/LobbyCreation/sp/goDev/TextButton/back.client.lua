script.Parent.MouseButton1Click:Connect(function()
	if  workspace.Administration.InstalledUsers:FindFirstChild(game.Players.LocalPlayer.Name) then
		script.Parent.Parent.Parent.Visible = false
		script.Parent.Parent.Parent.Parent.spPROP.Visible = true
	end
end)

if  workspace.Administration.InstalledUsers:FindFirstChild(game.Players.LocalPlayer.Name) then
	script.Parent.Parent.Visible = true
else
	script.Parent.Parent.Visible = false
end
