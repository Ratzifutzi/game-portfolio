local module = {}

function AddZero (number)
	local res = number
	
	if tonumber(number) < 10 then
		res = "0" .. tostring( number )
	end
	
	return res
end

function module.trasferTo_MM_SS_MS(number:number, divider:string, decimalSpaces:number)
	local minutes = math.floor(number / 60)
	local seconds = math.floor( number - ( minutes * 60 ) )
	local m_seconds = math.floor( ( ( number - ( minutes * 60 ) - seconds ) * (10 ^ decimalSpaces) ) + 0.5 )
	
	minutes = AddZero(minutes)
	seconds = AddZero(seconds)
	m_seconds = AddZero(m_seconds)
	
	if #tostring(m_seconds) > 2 then
		m_seconds = "00"
	end
	
	return minutes .. divider .. seconds .. divider .. m_seconds
end

return module
