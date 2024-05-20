local module = {}

function module.FormatIntToTime ( int:number )
	local minutes = tostring( math.floor( int / 60 ) )
	local seconds = tostring( math.floor( int - ( minutes * 60 ) ) )
	
	if tonumber( seconds ) < 10 then
		seconds = "0" .. seconds
	end

	return {
		["full"] = minutes .. "m" .. seconds .. "s",
		["minutes"] = minutes .. "m",
		["seconds"] = seconds .. "s"
	}
end

return module
