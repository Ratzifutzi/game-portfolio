script.Parent.ShiftTimeInSeconds.Value = script.Parent.HourTimeInSeconds.Value * 6
while true do
	wait()
	if script.Parent.Parent.Clock.Value < 7 and script.Parent.InfinityShift.Value == false then
		wait(script.Parent.HourTimeInSeconds.Value)
		script.Parent.Parent.Clock.Value = script.Parent.Parent.Clock.Value + 1
	else
		script.Parent.Parent.Clock.Value = 666
	end
end