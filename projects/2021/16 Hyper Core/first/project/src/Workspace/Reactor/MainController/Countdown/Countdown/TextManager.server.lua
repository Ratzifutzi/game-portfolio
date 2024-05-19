mins = "00"
secs = "00"
msecs = 0
val = workspace.Values.TimeRemain

while true do
	wait()
	script.Parent.Text = mins..":"..secs.. ":".. msecs
	
	
	mins = math.floor(val.Value / 60)
	secs = math.floor(val.Value - 60 * mins + 0.5)
	
	if mins == 0 then
		mins = "00"
	end
	
	if secs == 0 then
		secs = "00"
	end
	
	if tonumber(secs) < 10 and tonumber(secs) > 0 then
		secs = "0"..secs
	end
	
	if tonumber(mins) < 10 and tonumber(mins) > 0 then
		mins = "0"..mins
	end
	
	if val.Value == 0 then
		msecs = "00"
	else
		msecs = tostring(math.random(10,99))
	end
end