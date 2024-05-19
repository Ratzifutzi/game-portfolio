script.Parent.DoorName.Text = script.Parent.Adornee.Parent.Name
local Door = script.Parent.Adornee.Parent

function UpdateDisplay()
	if workspace.DevConsole.PermissionGroups:FindFirstChild(workspace.DevConsole.UserLevel.Value) then
		if workspace.DevConsole.PermissionGroups:FindFirstChild(workspace.DevConsole.UserLevel.Value):FindFirstChild("AccessUI") then
			if Door.OpenVal.Value == true then -- OPEN VALUE
				script.Parent.DataDisplay.Open.Text = "OPEN"
				script.Parent.DataDisplay.Open.TextColor3 = Color3.new(0,1,0)
			else
				script.Parent.DataDisplay.Open.Text = "CLOSED"
				script.Parent.DataDisplay.Open.TextColor3 = Color3.new(1,0,0)
			end
			
			if Door.Modified.Value == true then -- MODIFIED VALUE
				script.Parent.DataDisplay.Modified.Text = "MODIFIED"
				script.Parent.DataDisplay.Modified.TextColor3 = Color3.new(0, 0.0156863, 1)
			else
				script.Parent.DataDisplay.Modified.Text = "UNMODIFIED"
				script.Parent.DataDisplay.Modified.TextColor3 = Color3.new(0.0117647, 0.266667, 0)
			end
			
			script.Parent.DataDisplay.Clearence.Text = "LEVEL " .. tostring(Door.ClearenceReq.Value)
			script.Parent.DataDisplay.Clearence.TextColor3 = Color3.new(0, 0, 0)
			
			script.Parent.DataDisplay.Autoclose.Text = "LOCKED: " .. string.upper(tostring(Door.Locked.Value))
			script.Parent.DataDisplay.Autoclose.TextColor3 = Color3.new(1, 0, 0)
		else
			script.Parent.Enabled = false
		end
	else
		script.Parent.Enabled = false
	end
end

script.Parent.Open.MouseButton1Click:Connect(function()
	Door.RemoteOpen:FireServer()
end)

script.Parent.Close.MouseButton1Click:Connect(function()
	Door.RemoteClose:FireServer()
end)

script.Parent.Disconnect.MouseButton1Click:Connect(function()
	Door.RemoteDisconnect:FireServer()
end)

while true do
	wait()
	UpdateDisplay()
end