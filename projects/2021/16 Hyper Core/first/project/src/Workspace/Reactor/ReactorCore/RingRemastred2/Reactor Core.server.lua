Speed = 1 * workspace.Sounds.Meltdown.TimePosition + 1.5
while true do 
for i = 0, 360, Speed do 
script.Parent.CFrame = CFrame.new(script.Parent.Position)*CFrame.fromEulerAnglesXYZ(math.rad(i), math.rad(i), math.rad(i))
wait(.001)
end
end 

--Made By Fibber16,My First Script!