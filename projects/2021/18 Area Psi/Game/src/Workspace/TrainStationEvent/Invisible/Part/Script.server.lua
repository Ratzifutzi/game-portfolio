workspace.Events.PreIntro.Event:Connect(function()
	repeat
		script.Parent.Transparency = 1
	until script.Parent.Transparency == 1
	wait()
	script:Destroy()
end)