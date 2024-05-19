if script.Parent.Parent.Parent.TabControl.curTab.Value == script.Parent.Name then
	
	script.Parent.Visible = true
	
else
	
	script.Parent.Visible = false
	
end

script.Parent.Parent.Parent.TabControl.curTab.Changed:Connect(function()
	if script.Parent.Parent.Parent.TabControl.curTab.Value == script.Parent.Name then

		script.Parent.Visible = true

	else

		script.Parent.Visible = false

	end
end)