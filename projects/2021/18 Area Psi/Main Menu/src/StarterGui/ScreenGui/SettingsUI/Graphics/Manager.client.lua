function UpdateUI()
	script.Parent.DecorationLine.Top:TweenSize(UDim2.new(0.5 * script.Parent.Selected.Value, 0, 01, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quart, .3)
end

UpdateUI()

script.Parent.Selected.Changed:Connect(function()
	UpdateUI()
	local Ts = game:GetService("TweenService")
	Ts:Create(script.Parent.Parent.Parent.Fullscreen, TweenInfo.new(1.5,Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true), {BackgroundTransparency = 0}):Play()
	script.Parent.Parent.Parent.Fullscreen.BackgroundTransparency = 1
end)

NotificationBindable = Instance.new("BindableFunction")
function NotificationBindable.OnInvoke(response)
	print(response)
	if response == "Lower" then
		game.ReplicatedStorage.ChangeGraphics:FireServer(1)
		script.Parent.Selected.Value = 1
		UpdateUI()
	elseif response == "Lower Again" then
		game.ReplicatedStorage.ChangeGraphics:FireServer(0)
		script.Parent.Selected.Value = 0
		UpdateUI()
	end
end

repeat wait() until script.Parent.Parent.Parent.Fullscreen.BackgroundTransparency == 1

if workspace:GetRealPhysicsFPS() < 50 then
	game.StarterGui:SetCore("SendNotification", {
		Title = "Lag Detected",
		Text = "Lower graphics to medium?",
		Duration = 100,
		Button1 = "No",
		Button2 = "Lower",
		Callback = NotificationBindable
	})
end

wait(10)

if workspace:GetRealPhysicsFPS() < 50 then
	game.StarterGui:SetCore("SendNotification", {
		Title = "Still Lags?",
		Text = "Lower graphics to low?",
		Duration = 100,
		Button1 = "No",
		Button2 = "Lower Again",
		Callback = NotificationBindable
	})
end