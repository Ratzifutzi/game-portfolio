cooldown = false
script.Parent.Parent.MouseButton1Click:Connect(function()
	if cooldown == false then
		cooldown = true
		if script.Value.Value.Value == true then
			script.Value.Value.Value = false
			script.Value.Value.Parent.ActiveLaserCount.Value = script.Value.Value.Parent.ActiveLaserCount.Value - 1
		else
			script.Value.Value.Value = true
			script.Value.Value.Parent.ActiveLaserCount.Value = script.Value.Value.Parent.ActiveLaserCount.Value + 1
		end
		wait(5)
		cooldown = false
	end
end)


while true do
	wait()
	script.Parent.Visible = script.Value.Value.Value
	
	if script.Value.Value.Value == true then
		script.Parent.Parent.BackgroundColor3 = Color3.new(0, 1, 0)
	else
		script.Parent.Parent.BackgroundColor3 = Color3.new(1, 0, 0)
	end
end