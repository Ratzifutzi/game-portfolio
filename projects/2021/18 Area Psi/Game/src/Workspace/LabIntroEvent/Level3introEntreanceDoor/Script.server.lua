local root = script.Parent.Root
local TweenService = game:GetService("TweenService")
local Tinfo = TweenInfo.new(7.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local Sign = script.Parent.KeycardAuthA
local OldText = Sign.SurfaceGui.TRIGGER.Text
local OldCol = Sign.SurfaceGui.TRIGGER.TextColor3
local Trigger = Sign.SurfaceGui.TRIGGER
local SignB = script.Parent.KeycardAuthB
local TriggerB = SignB.SurfaceGui.TRIGGER
local open = script.Parent.OpenVal
Moving = false
open.Value = false

script.Parent.Open.Event:Connect(function()
	open.Value = true
	Moving = true
	local OpenTween = TweenService:Create(root, Tinfo, {
		CFrame = root.CFrame * CFrame.new(0,root.Size.Y - 0.25, 0)
	})
	local rOpenTween = TweenService:Create(script.Parent.RootRight, Tinfo, {
		CFrame = script.Parent.RootRight.CFrame * CFrame.new(script.Parent.RootRight.Size.X - 0.25, 0, 0)
	})
	local lOpenTween = TweenService:Create(script.Parent.RootLeft, Tinfo, {
		CFrame = script.Parent.RootLeft.CFrame * CFrame.new(-script.Parent.RootLeft.Size.X + 0.25, 0, 0)
	})
	root.hydraulic:Play()
	OpenTween:Play()
	wait(8)
	root.hydraulic:Play()
	rOpenTween:Play()
	lOpenTween:Play()
	wait(8)
	Moving = false
end)

script.Parent.Close.Event:Connect(function()
	Moving = true
	open.Value = false
	local CloseTween = TweenService:Create(root, Tinfo, {
		CFrame = root.CFrame * CFrame.new(0,-root.Size.Y + .25, 0)
	})
	local rOpenTween = TweenService:Create(script.Parent.RootRight, Tinfo, {
		CFrame = script.Parent.RootRight.CFrame * CFrame.new(-script.Parent.RootRight.Size.X + 0.25, 0, 0)
	})
	local lOpenTween = TweenService:Create(script.Parent.RootLeft, Tinfo, {
		CFrame = script.Parent.RootLeft.CFrame * CFrame.new(script.Parent.RootLeft.Size.X - 0.25, 0, 0)
	})
	root.hydraulic:Play()
	rOpenTween:Play()
	lOpenTween:Play()
	wait(8)
	root.hydraulic:Play()
	CloseTween:Play()
	wait(8)
	Moving = false
end)

function ManageDoor()
	if workspace.PlayerClearence.Value >= script.Parent.ClearenceReq.Value and Moving == false and script.Parent.Modified.Value == false then
		Moving = true
		Trigger.Text = "ACCES GRANTED"
		Trigger.TextColor3 = Color3.new(0,1,0)
		wait(1.5)
		Trigger.Text = "PLEASE WAIT..."
		Trigger.TextColor3 = Color3.new(1,1,0)
		if open.Value == false then
			if script.Parent.AutocloseTime.Value > -1 then

			else
				script.Parent.Open:Fire()
				open.Value = true
				wait(16)
				Trigger.Text = "CLOSE"
				Trigger.TextColor3 = OldCol
				Moving = false
			end
		else
			Trigger.Text = "PLEASE WAIT..."
			Trigger.TextColor3 = Color3.new(1,1,0)
			script.Parent.Close:Fire()
			open.Value = false
			wait(16)
			Trigger.Text = "OPEN"
			Trigger.TextColor3 = OldCol
			Moving = false
		end
	elseif workspace.PlayerClearence.Value >= script.Parent.ClearenceReq.Value and script.Parent.Modified.Value == false and Moving == false then
		Trigger.Text = "ACCES DENIED."
		Trigger.TextColor3 = Color3.new(1, 0, 0)
		wait(4)
		Trigger.Text = OldText
		Trigger.TextColor3 = OldCol
	end
end

Trigger.MouseButton1Click:Connect(function()
	ManageDoor()
end)


TriggerB.MouseButton1Click:Connect(function()
	ManageDoor()
end)

script.Parent.Modified.Changed:Connect(function()
	if script.Parent.Modified.Value == true and Moving == false then
		Trigger.Text = "PLEASE DISCONNECT REMOTE CONTROL FIRST"
		Trigger.TextColor3 = Color3.new(1,0,0)
	else
		if Moving == false then
			if open.Value == true then
				Trigger.Text = "CLOSE"
			else
				Trigger.Text = "OPEN"
			end
			Trigger.TextColor3 = OldCol
		end
	end
	repeat wait() until Moving == false
	if script.Parent.Modified.Value == true and Moving == false then
		Trigger.Text = "PLEASE DISCONNECT REMOTE CONTROL FIRST"
		Trigger.TextColor3 = Color3.new(1,0,0)
	else
		if Moving == false then
			if open.Value == true then
				Trigger.Text = "CLOSE"
			else
				Trigger.Text = "OPEN"
			end
			Trigger.TextColor3 = OldCol
		end
	end
end)

script.Parent.Locked.Changed:Connect(function()
	if script.Parent.Locked.Value == true then
		Trigger.Text = "LOCKED"
		Trigger.TextColor3 = Color3.new(1,0,0)
	else
		if Moving == false then
			if open.Value == true then
				Trigger.Text = "CLOSE"
			else
				Trigger.Text = "OPEN"
			end
			Trigger.TextColor3 = OldCol
		end
	end
end)

script.Parent.RemoteOpen.OnServerEvent:Connect(function(Activator)
	if workspace.DevConsole.PermissionGroups:FindFirstChild(workspace.DevConsole.UserLevel.Value) then
		if workspace.DevConsole.PermissionGroups:FindFirstChild(workspace.DevConsole.UserLevel.Value).ManageDoors.Value == true then
			script.Parent.Modified.Value = true
			if script.Parent.OpenVal.Value == false then
				if Moving == false then
					script.Parent.Open:Fire()
				else
					workspace.DevConsole.SendMessageToClient:FireClient(Activator, "Error", "Door is moving.", 5)
				end
			else
				workspace.DevConsole.SendMessageToClient:FireClient(Activator, "Error", "The door is already open.", 5)
			end
		else
			workspace.DevConsole.SendMessageToClient:FireClient(Activator, "Acces Denied", "You need the Permission 'ManageDoors' for this function.", 5)
		end
	end
end)

script.Parent.RemoteClose.OnServerEvent:Connect(function(Activator)
	if workspace.DevConsole.PermissionGroups:FindFirstChild(workspace.DevConsole.UserLevel.Value) then
		if workspace.DevConsole.PermissionGroups:FindFirstChild(workspace.DevConsole.UserLevel.Value).ManageDoors.Value == true then
			script.Parent.Modified.Value = true
			if script.Parent.OpenVal.Value == true then
				if Moving == false then
					script.Parent.Close:Fire()
				else
					workspace.DevConsole.SendMessageToClient:FireClient(Activator, "Error", "Door is moving.", 5)
				end
			else
				workspace.DevConsole.SendMessageToClient:FireClient(Activator, "Error", "The door is already closed.", 5)
			end
		else
			workspace.DevConsole.SendMessageToClient:FireClient(Activator, "Acces Denied", "You need the Permission 'ManageDoors' for this function.", 5)
		end
	end
end)

script.Parent.RemoteDisconnect.OnServerEvent:Connect(function(Activator)
	if Moving == false then
		if Moving == false then
			script.Parent.Modified.Value = false
		else
			workspace.DevConsole.SendMessageToClient:FireClient(Activator, "Error", "Cannot be disconnected yet.", 5)
		end
	else
		workspace.DevConsole.SendMessageToClient:FireClient(Activator, "Error", "Cannot be disconnected yet.", 5)
	end
end)