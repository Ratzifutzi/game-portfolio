workspace.DevConsole.UserLevel.Changed:Connect(function(value)
	script.Parent.Text = "Power Level: <b>" .. workspace.DevConsole.UserLevel.Value .. "</b>"
end)

wait(1)
script.Parent.Text = "Power Level: <b>" .. workspace.DevConsole.UserLevel.Value .. "</b>"