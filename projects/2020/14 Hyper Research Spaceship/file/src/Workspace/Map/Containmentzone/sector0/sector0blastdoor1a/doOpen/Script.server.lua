val=script.Parent.remotevalue.Value
while true do
	wait(val.Value==true)
	if val.Value==true then
		script.Parent.Value=true
		val.Value=false
	end
end