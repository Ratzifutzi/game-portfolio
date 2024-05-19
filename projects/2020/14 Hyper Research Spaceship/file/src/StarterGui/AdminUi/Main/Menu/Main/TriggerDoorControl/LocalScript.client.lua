i=0
script.Parent.MouseButton1Click:Connect(function(player)
	
	if i == 0 then
		i=1
		script.Parent.Parent.Parent.DoorControl.Visible=true
		return(3)
	else
		i=0
		script.Parent.Parent.Parent.DoorControl.Visible=false
		return(3)
	end
end)

