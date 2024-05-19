val=workspace.Values.EvacuationTunnels.Open
while true do
	wait()
	if val.Value==true then
		script.Parent.Value=true
		wait(.5)
	end
end