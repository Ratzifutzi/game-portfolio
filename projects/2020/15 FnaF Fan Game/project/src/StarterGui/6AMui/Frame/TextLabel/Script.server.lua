played = 0

wait(2)
while true do
	wait()
	if workspace.Values.Clock.Value == 6 and played == 0 then
		script.Parent.Parent.Visible = true
		played = 1
		script.Parent.Text = "5 AM"
		workspace.Sounds.Bell:Play()
		wait(.4)
		for i = 0,100 do
			wait(.001)
			script.Parent.Text = math.random(0,9) .. " AM"
		end
		script.Parent.Text = "6 AM"
		wait(.3)
		workspace.Sounds.Cheer:Play()
		wait(.9)
		for i = 0,100 do
			wait(.01)
			script.Parent.TextTransparency = i / 100
		end
		
		wait(3)
		script.Parent.Text = "Thank you for playing this game. More nights will be added soon. Like and follow the game to be notified of updates! Thank yaa :3 Have a nice day :> - Because you finished the game, i will give you acces to the Dev-Console :> Use 'Left Shift' + 'M' to open it!"
		workspace.Sounds.MusicBox:Play()
		for i = 0,100 do
			wait(.01)
			number = i / 100
			script.Parent.TextTransparency = 1 - number
		end
		
	end
end