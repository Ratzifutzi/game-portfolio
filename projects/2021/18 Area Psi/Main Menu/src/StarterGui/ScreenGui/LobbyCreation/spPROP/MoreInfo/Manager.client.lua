script.Parent.Parent.Settings.EnableIntro.MouseEnter:Connect(function()
	script.Parent.Intro.Visible = true
	script.Parent.DevConsole.Visible = false
end)
script.Parent.Parent.Settings.EnableIntro.MouseLeave:Connect(function()
	script.Parent.Intro.Visible = false
	script.Parent.DevConsole.Visible = false
end)
script.Parent.Parent.Settings.InfoIntro.MouseEnter:Connect(function()
	script.Parent.Intro.Visible = true
	script.Parent.DevConsole.Visible = false
end)
script.Parent.Parent.Settings.EnableIntro.MouseLeave:Connect(function()
	script.Parent.Intro.Visible = false
	script.Parent.DevConsole.Visible = false
end)


script.Parent.Parent.Settings.EnableCheats.MouseEnter:Connect(function()
	script.Parent.Intro.Visible = false
	script.Parent.DevConsole.Visible = true
end)
script.Parent.Parent.Settings.EnableCheats.MouseLeave:Connect(function()
	script.Parent.Intro.Visible = false
	script.Parent.DevConsole.Visible = false
end)
script.Parent.Parent.Settings.InfoDev.MouseEnter:Connect(function()
	script.Parent.Intro.Visible = false
	script.Parent.DevConsole.Visible = true
end)
script.Parent.Parent.Settings.InfoDev.MouseLeave:Connect(function()
	script.Parent.Intro.Visible = false
	script.Parent.DevConsole.Visible = false
end)