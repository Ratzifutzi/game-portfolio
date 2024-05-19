while true do
	wait()
	script.Parent.Stauts.Text = script.Parent.Parent.Parent.Parent.Status.Value
	script.Parent.SubStauts.Text = script.Parent.Parent.Parent.Parent.SubStatus.Value
	script.Parent.Stauts.TextColor3 = script.Parent.Parent.Parent.Parent.StatusColor.Value
	script.Parent.SubStauts.TextColor3 = script.Parent.Parent.Parent.Parent.StatusColor.Value
end