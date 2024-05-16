-- Define the part the light emitter is in
local LightPart = script.Parent:WaitForChild("Light")

-- Define the light emitter inside the LightPart
local SpotLight = LightPart:WaitForChild("SpotLight")

-- Define the Configuration folder
local Configuration = script.Parent:WaitForChild("Configuration")

-- Define setting instances
local IsLightOn = Configuration:WaitForChild("IsLightOn")
local LightRange = Configuration:WaitForChild("LightRange")

-- Other
local Heartbeat = game:GetService("RunService").Heartbeat

-- Tweens (dynamically sets to) the light emitter's range for added effect
local function TweenRange(TweenSpeed,FromRange,ToRange,FromTrans,ToTrans)
	for i=0,1,1/(TweenSpeed/0.01) do
		if IsLightOn.Value == false then return end
		
		local NewRange = FromRange * (1-i) + ToRange * i
		local NewTrans = FromTrans * (1-i) + ToTrans * i
		
		SpotLight.Range = NewRange
		
		LightPart.Transparency = NewTrans
		
		wait()
	end
	SpotLight.Range = ToRange
	LightPart.Transparency = FromTrans
end

-- Function to flicker the light emitter (SpotLight)
local function FlickerLight(Delay,TweenSpeed,ToRange,FromTrans,ToTrans)
	if IsLightOn.Value == true then
	
		SpotLight.Range = 0
		
		wait(Delay)
		
		-- Check if light is still set to be turned on
		if IsLightOn.Value == true then
			TweenRange(TweenSpeed,0,ToRange,FromTrans,ToTrans)
			wait(Delay)
		end
	
	end
end

-- Function to turn light emitter on or off (SpotLight)
local function ConfigLight()
	-- true == on, false == off (checked, unchecked)
	
	if IsLightOn.Value == true then
		LightPart.Material = "Neon"
		
		FlickerLight(0.05,0.025,LightRange.Value*0.75,1,0)
		FlickerLight(0.25,0.045,LightRange.Value,1,0)
		
		FlickerLight(0.05,0.045,LightRange.Value*0.75,1,0)
		FlickerLight(0.05,0.02,LightRange.Value,1,0)
		
		LightPart.Transparency = 0
	else
		LightPart.Material = "SmoothPlastic"
		LightPart.Transparency = 0
		SpotLight.Range = 0
	end
	
end

-- Changes the max range for the light
local function ChangeRange()
	SpotLight.Range = LightRange.Value
end

-- Listeners for inputs
IsLightOn.Changed:connect(ConfigLight)

LightRange.Changed:connect(ChangeRange)

-- First run things
ConfigLight()