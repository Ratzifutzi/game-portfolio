TS = game:GetService("TweenService")

MouseOnGrid = nil
BuildMode = false
ObjectToBuild = nil
UserInputService = game:GetService("UserInputService")

TweenService = game:GetService("TweenService")

function Update()
	local Number = 0
	script.Parent.ScrollingFrame:ClearAllChildren()
	local BuildInv = game.Players.LocalPlayer.BuildInv:GetChildren()
	--print(Number)
	for Number, Child in pairs(BuildInv) do
		Number = Number - 1
		local Obj = script.ObjectExample:Clone()
		Obj.Parent =script.Parent.ScrollingFrame
		Obj.Name = Child.Name
		Obj.NameText.Text = Child.Name
		Obj.Visible = true
		Obj.amount.Text = tostring(Child:WaitForChild("Amount").Value) .. "x"
		Obj.Position = UDim2.new(0, 05, 0, 30 * Number)
	end
	if #BuildInv == 0 then
		local Obj = script.NoObj:Clone()
		Obj.Parent = script.Parent.ScrollingFrame
	end
end

game.Players.LocalPlayer.BuildInv.ChildAdded:Connect(function()
	Update()
end)

game.Players.LocalPlayer.BuildInv.ChildRemoved:Connect(function()
	Update()
end)

script.Parent.updateList.Event:Connect(function()
	Update()
end)

local players = game:GetService("Players")
local plr = players.LocalPlayer

local runService = game:GetService("RunService")

local mouse = plr:GetMouse()

mouse.Move:Connect(function()
	MouseOnGrid = mouse.Target
	local Target = mouse.Target
	if BuildMode == true and Target.Parent == workspace.Plot.gridsys.Grids and Target.GridUsed.Value == false then
		--print(Target.Name)
		script.Parent.Parent.Click.Visible = true
		local Panel = ObjectToBuild.Decorations

		local Part1 = Panel.Parent.Root -- !! NAME THE MAIN PART "Root" !! --

		if MouseOnGrid.Parent.Name == "Grids" then
			if MouseOnGrid then
				local TI = TweenInfo.new(.5, Enum.EasingStyle.Circular)
				local RootMovePart = ObjectToBuild.Root
				local goal = {CFrame = MouseOnGrid.CFrame}

				local MoveTween = TweenService:Create(RootMovePart, TI , goal)

				MoveTween:Play()
				
				script.Parent.Parent.Click.MouseButton1Click:Connect(function()
					if BuildMode == true then
						game.ReplicatedStorage.PlaceObject:FireServer(ObjectToBuild.Name, Target.Name)
						print("fired")
						script.Parent.Parent.Click.Visible = false
						BuildMode = false
						ObjectToBuild:Destroy()
						script.Parent:TweenPosition(UDim2.new(1,0,0,0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, .3)
						wait(.3)
						Update()
					end
				end)
				
			end
		end
		wait(.5)
	end
end)

script.Parent.BuildObj.Event:Connect(function(Obj)
	script.Parent:TweenPosition(UDim2.new(1,320,0,0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, .3)
	ObjectToBuild = game.ReplicatedStorage.AvaibleObjects:FindFirstChild(Obj):Clone()
	ObjectToBuild.Parent = workspace.Plot.LocalStorage
	BuildMode = true
end)

script.Parent.Quit.MouseButton1Click:Connect(function()
	script.Parent:TweenPosition(UDim2.new(1,320,0,0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, .3)
	
	local Camera = workspace.CurrentCamera


	repeat wait()
		Camera.CameraType = Enum.CameraType.Scriptable
	until Camera.CameraType == Enum.CameraType.Scriptable

	local TI = TweenInfo.new(0, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)

	local CTin = TS:Create(workspace.CurrentCamera, TI, {
		CFrame = game.Players.LocalPlayer.Character.Head.CFrame
	})

	CTin:Play()	
	wait(0)
	repeat wait()
		Camera.CameraType = Enum.CameraType.Custom
	until Camera.CameraType == Enum.CameraType.Custom
	
end)

