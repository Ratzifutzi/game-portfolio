while true do
	wait()
	if script.Parent.Value > 0 then
		wait(1)
		script.Parent.Value = script.Parent.Value - 1
	end
end