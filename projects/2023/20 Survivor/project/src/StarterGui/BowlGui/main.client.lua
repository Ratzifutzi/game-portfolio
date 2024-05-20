local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local IconTweenInfo = TweenInfo.new( 1, Enum.EasingStyle.Linear )
local Mouse = game.Players.LocalPlayer:GetMouse()

local allowNextExecute = true
local mouseDown = false

local displays = script.Parent.Displays
local buttons = script.Parent.Buttons

TimeFormat = require(game.ReplicatedStorage.Modules.Formatting.Time)


RunService.RenderStepped:Connect(function()
	if not allowNextExecute then return nil end
	allowNextExecute = false
	
	local config = require( game.ReplicatedStorage.Configuration )
	
	local fuelLeft = math.max(0, workspace.Values.Bowl.FuelTill.Value - DateTime.now().UnixTimestamp)
	
	local currentHealth = workspace.Values.Bowl.Health.Value
	
	displays["01_Health"].Amount.Text = tostring( currentHealth  ) .. " / " .. tostring( config.FireBowl.MaximalHealth )
	displays["02_Duration"].Amount.Text = TimeFormat.FormatIntToTime( fuelLeft ).full .. "/" .. TimeFormat.FormatIntToTime( config.FireBowl.MaximalBurnTime ).minutes
	
	local healthTween = TweenService:Create( displays["01_Health"].UIGradient, IconTweenInfo, {
		Offset = Vector2.new(0, 1 - ( currentHealth / config.FireBowl.MaximalHealth ) )
	} )
	local durationTween = TweenService:Create( displays["02_Duration"].UIGradient, IconTweenInfo, {
		Offset = Vector2.new(0, 1 - ( fuelLeft / config.FireBowl.MaximalBurnTime ) )
	} )
	
	healthTween:Play()
	durationTween:Play()
	
	healthTween.Completed:Connect(function()
		allowNextExecute = true
	end)
	
	-- Disable Buttons
	buttons["02_refuel"].Visible = fuelLeft ~= config.FireBowl.MaximalBurnTime
	buttons["01_repair"].Visible = currentHealth ~= config.FireBowl.MaximalHealth
end)

-- Mouse
buttons["02_refuel"].MouseButton1Down:Connect(function()
	mouseDown = true
	
	repeat
		game.ReplicatedStorage.Functions.ClientToServer.Bowl.RequestFuel:InvokeServer()

		allowNextExecute = true
		wait(.2)
	until not mouseDown
end)

Mouse.Button1Up:Connect(function()
	mouseDown = false
end)
buttons["02_refuel"].MouseLeave:Connect(function()
	mouseDown = false
end)
buttons["02_refuel"].MouseButton1Up:Connect(function()
	mouseDown = false
end)