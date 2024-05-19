TS = game:GetService("TweenService")

script.Parent.MouseButton1Click:Connect(function()
	local Camera = workspace.CurrentCamera


	repeat wait()
		Camera.CameraType = Enum.CameraType.Scriptable
	until Camera.CameraType == Enum.CameraType.Scriptable
	
	local TI = TweenInfo.new(2.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
	
	local CTin = TS:Create(workspace.CurrentCamera, TI, {
		CFrame = workspace.Plot.Plots.MainBase.Camera.CFrame
	})
	
	CTin:Play()	
	script.Parent.Parent:TweenPosition(UDim2.new(0,0,-1,0), Enum.EasingDirection.InOut,  Enum.EasingStyle.Sine, 1)
	wait(2.75)
	
	local blur = Instance.new("BlurEffect")
	blur.Parent = game.Lighting
	script.Parent.Parent.Parent.Wait.Visible = true
	local inventory = nil
	inventory = game.ReplicatedStorage.LoadBackpack:InvokeServer()
	if inventory == true then
		script.Parent.Parent.Parent.Wait.Visible = false
		blur:Destroy()
		workspace.Plot.gridsys.EnableGrid.Value = true
		script.Parent.Parent.Parent.Build.Visible = true
		game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
		game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
		script.Parent.Parent.Parent.Build.updateList:Fire()
	end
end)