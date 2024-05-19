while true do
	wait()
	if workspace.Values.MeltdownInProgress.Value == true or workspace.MainMenu.PlrInMainMenu.Value == true then
		script.Parent.Enabled =  false
	else if script.Parent.Enabled == false then
			script.Parent.Enabled = true
		end
	end
end