i=0
text=script.Parent.Text
script.Parent.MouseButton1Click:Connect(function(player)
	
	if i == 0 then
		workspace.Values.EvacuationTunnels.Open.Value=true
		workspace.Values.Evacuation.Value=true
		script.Parent.Text="Please Wait..."
		i=2
		wait(10)
		script.Parent.Text=text
		i=1
		return(3)
	else
		workspace.Values.EvacuationTunnels.Close.Value=true
		workspace.Values.Evacuation.Value=false
		script.Parent.Text="Please Wait..."
		i=2
		wait(10)
		script.Parent.Text=text
		i=0
		return(3)
	end
end)


while true do
	wait()
	if workspace.Values.Evacuation.Value==true then
		script.Parent.BackgroundColor3=Color3.new(0, 0.666667, 0)
	else
		script.Parent.BackgroundColor3=Color3.new(0.666667, 0, 0)
	end
end
