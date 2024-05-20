ReplicatedStorage = game:GetService("ReplicatedStorage")

local STRUCTURES = ReplicatedStorage.Structures

for k, button : TextButton in pairs( script.Parent.Sidebar:GetChildren() ) do
	if not button:IsA("TextButton") then continue end
	
	button.MouseButton1Click:Connect(function()
		for k, frame : Frame in pairs( script.Parent.Content:GetChildren() ) do
			if not frame:IsA("Frame") then continue end
			
			frame:Destroy()
		end
		
		for k, v in pairs( STRUCTURES[button.Name]:GetChildren() ) do
			local c = script.Cell:Clone()
			
			c.Structure.Value = v
			c.Parent = script.Parent.Content
		end
	end)
end