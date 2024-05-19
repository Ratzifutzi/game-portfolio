GraphicsLevelToSet = 1
script.Parent.Button.MouseButton1Click:Connect(function()
	game.ReplicatedStorage.ChangeGraphics:FireServer(GraphicsLevelToSet)
	script.Parent.Parent.Selected.Value = GraphicsLevelToSet
end)