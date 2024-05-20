TweenService = game:GetService("TweenService")
ReplicatedStorage = game:GetService("ReplicatedStorage")

BuildSystem = require( ReplicatedStorage.Modules.BuildSystem )

local Root = script.Parent

Root.Structure.Changed:Connect(function( structure : Instance )
	Root.ItemName.Text = structure.Name
	
	for k, v in pairs( structure.BuildCost:GetChildren() ) do
		local c = script.PriceTextExample:Clone()
		
		c.ImageLabel.Image = v.Value.TextureId
		c.ItemName.Text = string.format( c.ItemName.Text, v:GetAttribute("Amount"), v.Value.Name )
		c.Name = v.Value.Name
		
		c.Parent = Root.Cost
	end
	
	Root.Button.MouseButton1Click:Connect(function()
		BuildSystem.StartPlacement( structure )
	end)
	-------------------
	Root.MouseEnter:Connect(function()
		TweenService:Create( Root.Cost, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
			GroupTransparency = 0.3
		} ):Play()
	end)
	Root.MouseLeave:Connect(function()
		TweenService:Create( Root.Cost, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
			GroupTransparency = 1
		} ):Play()
	end)
end)