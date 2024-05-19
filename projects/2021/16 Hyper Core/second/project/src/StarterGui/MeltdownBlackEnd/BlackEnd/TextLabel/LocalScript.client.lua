while true do
	wait()
	
	if workspace.Values.MeltdownInProgress.Value == true and workspace.Values.TimeRemain.Value == 5 then
		script.Parent.Visible = true
		for i = 0,100 do
			script.Parent.BackgroundTransparency = 1 - i / 100
			wait(.01)
		end
	end
	
	if workspace.BlackEndText.Send.Value == true then
		workspace.BlackEndText.Send.Value = false
		script.Parent.Text = workspace.BlackEndText.Text.Value
		script.Parent.TextTransparency = 1
		for i = 0,100 do
			script.Parent.TextTransparency = 1 - i / 100
			wait(.005)
		end
	end
	
	if workspace.BlackEndText.Hide.Value == true then
		workspace.BlackEndText.Hide.Value = false
		for i = 0,100 do
			script.Parent.TextTransparency = i / 100
			wait(.005)
		end
	end
end