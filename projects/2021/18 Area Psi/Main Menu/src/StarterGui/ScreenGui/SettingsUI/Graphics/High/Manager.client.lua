GraphicsLevelToSet = 2
script.Parent.Button.MouseButton1Click:Connect(function()
	game.ReplicatedStorage.ChangeGraphics:FireServer(GraphicsLevelToSet)
	script.Parent.Parent.Selected.Value = GraphicsLevelToSet
end)