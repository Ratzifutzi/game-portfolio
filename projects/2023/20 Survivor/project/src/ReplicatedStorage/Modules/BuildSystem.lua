-- Old Build System
-- SUBJECT TO CHANGE TODO

ReplicatedStorage = game.ReplicatedStorage
RunService = game:GetService("RunService")
UserInputService = game.UserInputService
TweenService = game:GetService("TweenService")

local module = {}

module.PlacementActive = false

function module.StartPlacement( object:Model ):boolean
	local config = require( game.ReplicatedStorage.Configuration )
	
	if module.PlacementActive then return end
	module.PlacementActive = true

	local PlaceColors = {
		[false] = Color3.new(1, 0, 0),
		[true] = Color3.new(0, 1, 0)
	}
	
	local clone = object:Clone()
	local keysDown = {}
	local pos
	local res = nil

	clone.Parent = workspace.TargetFilter

	local function changeColor(color:Color3)
		for k, part:BasePart in pairs(clone:GetDescendants()) do
			if not part:IsA("BasePart") then continue end
			if part.Name == "Hitbox" or part.Name == "MouseTarget" then continue end

			part.Color = color
			part.Material = Enum.Material.SmoothPlastic
			part.Transparency = 0.5
			part.CanCollide = false
		end
	end
	changeColor( Color3.new(0, 1, 0) )

	local renderSteppedConnection = RunService.RenderStepped:Connect(function( dt:number )
		-- Position
		local targetCFrame
		if config.BuildSystem.UseGridPlacement then
			targetCFrame = ( CFrame.new( Vector3.new( 
				math.floor( game.Players.LocalPlayer:GetMouse().Hit.Position.X + 0.5), 
				game.Players.LocalPlayer:GetMouse().Hit.Position.Y,
				math.floor( game.Players.LocalPlayer:GetMouse().Hit.Position.Z + 0.5)
				) ) 
					* CFrame.Angles(0, math.rad(module.currentSetRotation.Y), 0)	
			)
		else
			targetCFrame = ( CFrame.new( Vector3.new( 
				game.Players.LocalPlayer:GetMouse().Hit.Position.X, 
				game.Players.LocalPlayer:GetMouse().Hit.Position.Y,
				game.Players.LocalPlayer:GetMouse().Hit.Position.Z
				) ) 
					* CFrame.Angles(0, math.rad(module.currentSetRotation.Y), 0)	
			)
		end
		clone.MouseTarget.CFrame = targetCFrame

		-- Validation
		local canPlace = require( ReplicatedStorage.Modules.Validations.CanPlace ).validate(clone.Hitbox)

		changeColor( PlaceColors[canPlace] )
		
		-- Set Rotation Value
		--module.currentSetRotation = clone.MouseTarget.Rotation
	end)

	local inputBeganConnection = UserInputService.InputBegan:Connect(function( inputObj:InputObject, gameProcessed )
		table.insert(keysDown, inputObj.KeyCode)

		if inputObj.KeyCode == config.Keybinds.Build.RotateRight then
			--clone.MouseTarget.Rotation += Vector3.new(0, 360 / config.BuildSystem.SnapRotateSteps, 0)
			module.currentSetRotation += Vector3.new(0, -(360 / config.BuildSystem.SnapRotateSteps), 0)
		end

		if inputObj.KeyCode == config.Keybinds.Build.RotateLeft then
			--clone.MouseTarget.Rotation += Vector3.new(0, -( 360 / config.BuildSystem.SnapRotateSteps ), 0)
			module.currentSetRotation += Vector3.new(0, (360 / config.BuildSystem.SnapRotateSteps), 0)
		end
	end)
	
	local function endPlacement( buildItem : boolean )
		if res ~= nil then return end
		
		if buildItem then
			res = game.ReplicatedStorage.Functions.ClientToServer.Build.RequestPlacement:InvokeServer( 
				object,
				clone.Hitbox.CFrame
			)
		end
		
		module.PlacementActive = false

		inputBeganConnection:Disconnect()
		renderSteppedConnection:Disconnect()
		clone:Destroy()
	end
	
	game.Players.LocalPlayer:GetMouse().Button1Up:Once( function()
		endPlacement( true )
	end)
	local uisConnection uisConnection = UserInputService.InputBegan:Connect(function(input : InputObject)
		if input.KeyCode ~= Enum.KeyCode.X then return end
		
		uisConnection:Disconnect()
		endPlacement( false )
	end)
	
	
	repeat
		wait()
	until res ~= nil
	
	return res
end

module.currentSetRotation = Vector3.zero

return module
