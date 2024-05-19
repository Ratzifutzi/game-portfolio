door=script.Parent.door
doopen=script.Parent.doOpen
doclose=script.Parent.doClose

x=door.Position.X
y=door.Position.Y
z=door.Position.Z

bx=door.Position.X
by=door.Position.Y
bz=door.Position.Z

stepsdown=10
soundlenght=door.sound.TimeLength
soundspeed=door.sound.PlaybackSpeed

soundspeed=soundspeed*1
soundspeed=soundspeed/stepsdown

door.sound.PlaybackSpeed=soundspeed

function Open()
	x=door.Position.X
	y=door.Position.Y
	z=door.Position.Z
	door.sound.Playing=true
	for I=1,stepsdown*100 do
		wait(.01)
		door.Position=Vector3.new(x,y+I/100,z)
	end
	door.Position=Vector3.new(bx, by+stepsdown,bz)
	if script.Parent.passbuttontrigger.Value==true then
		wait(5)
		Close()
		wait(1)
		script.Parent.passbuttontrigger.Value=false
	end
	script.Parent.open.Value=true
	x=door.Position.X
	y=door.Position.Y
	z=door.Position.Z
end

function Close()
	x=door.Position.X
	y=door.Position.Y
	z=door.Position.Z
	door.sound.Playing=true
	for I=1,stepsdown*100 do
		wait(.01)
		door.Position=Vector3.new(x,y-I/100,z)
	end
	door.Position=Vector3.new(bx, by,bz)
	script.Parent.open.Value=false
	x=door.Position.X
	y=door.Position.Y
	z=door.Position.Z
end

while true do
	wait()
	if doopen.Value==true and script.Parent.locked.Value==false then
		script.Parent.open.Value=true
		doopen.Value=false
		Open()
		script.Parent.open.Value=true
		
	end
	if doclose.Value==true and script.Parent.locked.Value==false then
		script.Parent.open.Value=false
		doclose.Value=false
		Close()
		script.Parent.open.Value=false
		
		
		
	end
	
	if script.Parent.passbuttontrigger.Value==true then
		
		Open()
		
	end
	x=door.Position.X
	y=door.Position.Y
	z=door.Position.Z
end