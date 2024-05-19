Values = workspace.Values.AirlockCore

openDoorA = Values.openDoorA
openDoorB = Values.openDoorB

DoorAopen = false
DoorBopen = false

ecspalyed = false

Locked = Values.Locked
Active = false

OneDoorOpen = false

DoorA1 = script.Parent.DoorA1
DoorA2 = script.Parent.DoorA2
DoorB1 = script.Parent.DoorB1
DoorB2 = script.Parent.DoorB2

DoorAproxi = script.ProxiBlockA.ProximityPrompt
DoorBproxi = script.ProxiBlockB.ProximityPrompt
Eproxi = script.Eproxi.ProximityPrompt

script.Gas.A.Steam.Enabled = false
script.Gas.B.Steam.Enabled = false
script.Gas.C.Steam.Enabled = false


DoorAproxi.Triggered:Connect(function()
	if Locked.Value == false and OneDoorOpen == false then
		OneDoorOpen = true
		Eproxi.Enabled = false
		OpenA()
		wait(5)
		CloseA()
		Active = true
		wait(3)
		Trigger("A")
	end
end)

DoorBproxi.Triggered:Connect(function()
	if Locked.Value == false and OneDoorOpen == false then
		OneDoorOpen = true
		Eproxi.Enabled = false
		OpenB()
		wait(5)
		CloseB()
		Active = true
		wait(3)
		Trigger("B")
	end
end)

Eproxi.Triggered:Connect(function()
	if Locked.Value == false then
		DoorAproxi.Enabled = false
		DoorBproxi.Enabled = false
		OpenA()
		wait(3)
		CloseA()
		DoorAproxi.Enabled = true
		DoorBproxi.Enabled = true
	end
end)

function Trigger(Side)
	print("Deco-Trigger")
	DoorAproxi.Enabled = false
	DoorBproxi.Enabled = false
	script.Gas.A.Steam.Enabled = true
	script.Gas.B.Steam.Enabled = true
	script.Gas.C.Steam.Enabled = true
	script.Sound.Gas.Playing = true
	wait(7.5)
	script.Gas.A.Steam.Enabled = false
	script.Gas.B.Steam.Enabled = false
	script.Gas.C.Steam.Enabled = false
	script.Sound.Gas.Playing = false
	wait(.5)
	script.Sound.Beep:Play()
	wait(.5)
	
	Active = false
	if Locked.Value == false then
		if Side == "A" then
			OpenB()
			wait(4)
			CloseB()
			Eproxi.Enabled = true
			DoorAproxi.Enabled = true
			DoorBproxi.Enabled = true
		else
			OpenA()
			wait(4)
			CloseA()
			Eproxi.Enabled = true
			DoorAproxi.Enabled = true
			DoorBproxi.Enabled = true
		end
		wait(1)
		OneDoorOpen = false
	end
end

function OpenA()
	if DoorAopen == false then
		if Active == false then
			DoorAproxi.Enabled = false
			DoorBproxi.Enabled = false
			
			DoorAopen = true

			script.Sound.Move.Playing = true
			for i = DoorA1.Position.Z, DoorA1.Position.Z + DoorA1.Size.Z * 5 do
				DoorA1.Position = Vector3.new(DoorA1.Position.X, DoorA1.Position.Y, DoorA1.Position.Z + .2)
				DoorA2.Position = Vector3.new(DoorA2.Position.X, DoorA2.Position.Y, DoorA2.Position.Z - .2)
				wait(.001)
			end
			script.Sound.Move.Playing = false
			script.Sound.End:Play()
			
			DoorAproxi.Enabled = true
			DoorBproxi.Enabled = true
			
		end
	end
end

function CloseA()
	if DoorAopen == true then
		if Active == false then
			DoorAproxi.Enabled = false
			DoorBproxi.Enabled = false
			
			DoorAopen = false
			script.Sound.Move.Playing = true
			for i = DoorA1.Position.Z, DoorA1.Position.Z + DoorA1.Size.Z * 5 do
				DoorA1.Position = Vector3.new(DoorA1.Position.X, DoorA1.Position.Y, DoorA1.Position.Z - .2)
				DoorA2.Position = Vector3.new(DoorA2.Position.X, DoorA2.Position.Y, DoorA2.Position.Z + .2)
				wait(.001)
			end
			script.Sound.Move.Playing = false
			script.Sound.End:Play()
			
			DoorAproxi.Enabled = true
			DoorBproxi.Enabled = true
		end
	end
end

function OpenB()
	if DoorBopen == false then
		if Active == false then
			DoorAproxi.Enabled = false
			DoorBproxi.Enabled = false
			
			DoorBopen = true

			script.Sound.Move.Playing = true
			for i = DoorB1.Position.Z, DoorB1.Position.Z + DoorB1.Size.Z * 5 do
				DoorB1.Position = Vector3.new(DoorB1.Position.X, DoorB1.Position.Y, DoorB1.Position.Z + .2)
				DoorB2.Position = Vector3.new(DoorB2.Position.X, DoorB2.Position.Y, DoorB2.Position.Z - .2)
				wait(.001)
			end
			script.Sound.Move.Playing = false
			script.Sound.End:Play()
			
			DoorAproxi.Enabled = true
			DoorBproxi.Enabled = true
			
		end
	end
end

function CloseB()
	if DoorBopen == true then
		if Active == false then
			DoorAproxi.Enabled = false
			DoorBproxi.Enabled = false
			
			DoorBopen = false
			script.Sound.Move.Playing = true
			for i = DoorB1.Position.Z, DoorB1.Position.Z + DoorB1.Size.Z * 5 do
				DoorB1.Position = Vector3.new(DoorB1.Position.X, DoorB1.Position.Y, DoorB1.Position.Z - .2)
				DoorB2.Position = Vector3.new(DoorB2.Position.X, DoorB2.Position.Y, DoorB2.Position.Z + .2)
				wait(.001)
			end
			script.Sound.Move.Playing = false
			script.Sound.End:Play()
			
			DoorAproxi.Enabled = true
			DoorBproxi.Enabled = true
		end
	end
end







while true do
	wait()
	if Locked.Value == true then
		DoorAproxi.ActionText = "LOCKED"
		DoorBproxi.ActionText = "LOCKED"
	end
	
	if Active == true then
		DoorAproxi.Enabled = false
		DoorBproxi.Enabled = false
	else
		DoorAproxi.Enabled = true
		DoorBproxi.Enabled = true
	end
	if workspace.Values.AirlockCore.Locked.Value == true then
		script.Parent.Status.Value = "LOCKED"
		script.Parent.SubStatus.Value = "AREA UNDER LOCKDOWN"
		script.Parent.StatusColor.Value = Color3.new(1, 0, 0)
		if workspace.Values.ECS.Lock.Value == false then
			CloseA()
			CloseB()
		end
	elseif Active == true then
		script.Parent.Status.Value = "PLEASE WAIT"
		script.Parent.SubStatus.Value = "ALREADY IN USE"
		script.Parent.StatusColor.Value = Color3.new(1, 0.917647, 0)
	else
		script.Parent.Status.Value = "READY"
		script.Parent.SubStatus.Value = "TO USE"
		script.Parent.StatusColor.Value = Color3.new(0.215686, 1, 0)
	end
		
	if workspace.Values.ECS.Lock.Value == true and ecspalyed == false then
		ecspalyed = true
		Locked.Value = true
		script.Parent.Status.Value = "LOCKED"
		script.Parent.SubStatus.Value = "AREA UNDER LOCKDOWN"
		script.Parent.StatusColor.Value = Color3.new(1, 0, 0)
		while DoorAopen == false do
			wait()
			OpenA()
		end
	end
end
