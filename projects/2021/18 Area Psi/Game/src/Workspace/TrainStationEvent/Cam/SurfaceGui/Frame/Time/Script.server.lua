while true do
	wait()
	local hrs = tonumber(os.date("%H"))
	local mins = tonumber(os.date("%M"))
	local secs = tonumber(os.date("%S"))
	local MilS = tonumber(math.random(11,99))
	if hrs <= 9 then
		hrs = "0" .. hrs
	end
	if mins <= 9 then
		mins = "0" .. mins
	end
	if secs <= 9 then
		secs = "0" .. secs
	end
	
	script.Parent.Text = hrs .. ":" .. mins .. ":" .. secs .. ":" .. MilS
end