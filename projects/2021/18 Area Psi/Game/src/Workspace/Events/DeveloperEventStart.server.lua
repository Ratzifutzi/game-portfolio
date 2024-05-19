if game:GetService("RunService"):IsStudio() == true then
	wait(5)
	script.Parent:Fire()
	script.Parent.FireToLocal:FireAllClients()
	print("Fired ".. script.Parent.Name .. "-Event")
end