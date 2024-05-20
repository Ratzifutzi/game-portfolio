ReplicatedStorage = game:GetService("ReplicatedStorage")

local Root = script.Parent

local STRUCTURES = ReplicatedStorage.Structures

for k, tab in pairs( STRUCTURES:GetChildren() ) do
	local c = script.Button:Clone()
	
	c.Name = tab.Name
	c.ImageLabel.Image = tab:GetAttribute("Icon")
	c.TextLabel.Text = tab.Name
	
	c.Parent = Root.Sidebar.Content
	
	c.MouseButton1Click:Connect(function()
		for k, frame : Frame in pairs( Root.Content:GetChildren() ) do
			if not frame:IsA("Frame") then continue end

			frame:Destroy()
		end

		for k, v in pairs( tab:GetChildren() ) do
			local c = script.Cell:Clone()
			
			c.Parent = Root.Content
			c.Structure.Value = v
		end
	end)
end