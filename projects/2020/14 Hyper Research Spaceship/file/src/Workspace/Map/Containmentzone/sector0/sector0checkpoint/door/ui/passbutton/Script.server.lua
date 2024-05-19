oldtext=script.Parent.Text

script.Parent.MouseButton1Click:Connect(function(player)
	script.Parent.Parent.Parent.Parent.passbuttontrigger.Value=true
end)

while true do
	wait()
	if script.Parent.Parent.Parent.Parent.passbuttontrigger.Value==true then
		script.Parent.BackgroundColor3=Color3.new(171, 0, 0)
		script.Parent.Text="Please Wait.."
	else
		script.Parent.BackgroundColor3=Color3.new(0.298039, 0.298039, 0.298039)
		script.Parent.Text=oldtext
	end
end