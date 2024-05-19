yesbutton=script.Parent.yes
nobutton=script.Parent.no
infotextlabel=script.Parent.Info
infotext="You have acces to the Remote-Control/Admin-Control. Are you want open it?"
closetime=20
stopcounting=0


script.Parent.Parent.Menu.Visible=false
if game.Players.LocalPlayer.Name=="RAtzifuzti" or game.Players.LocalPlayer.Name=="Ratzifutzi" or game.Players.LocalPlayer.Name=="0oLoser_einhorno0" or game.Players.LocalPlayer.Name=="Dirt_Player" then
	script.Parent.Visible=true
else
	script.Parent.Visible=false
end

nobutton.MouseButton1Click:Connect(function(clicker)
	infotextlabel.Text="Closing..."
	stopcounting=1
	wait(1.5)
	script.Parent:Destroy()
end)

yesbutton.MouseButton1Click:Connect(function(clicker)
	script.Parent.Visible=false
	script.Parent.Parent.Menu.Visible=true
	
end)



for i=0,closetime do
	if stopcounting==0 then
		infotextlabel.Text=infotext.." Disappers in "..closetime-i.." Seconds"
		wait(1)
	end
	if closetime-i==0 then
		script.Parent:Destroy()
	end
end




