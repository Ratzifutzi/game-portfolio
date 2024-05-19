workspace.Events.Intro.Lab.Event:Connect(function()
	script.Parent.BackgroundTransparency = 0
	script.Parent.BackgroundColor3 = Color3.new(1,1,1)
	for i = 0, 100 do
		wait(.01)
		script.Parent.BackgroundTransparency = i / 100
	end
end)