val=workspace.Values.EvacuationTunnels.Close
while true do
	wait()
	if val.Value==true then
		script.Parent.Value=true
		wait(.5)
	end
end