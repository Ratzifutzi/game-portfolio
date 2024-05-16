-- LampLights
-- ProfBeetle
-- August 28, 2015

--[[
	This script will flicker PointLights to make them appear to be candle flames.
	
	It will find any PointLights that are children of it's Parent and that have a
	name starting with 'FlameLight' and start adjusting their Brightness and Range 
	over time in a realistic way.
	
	To use it simply put it in a model containing PointLights and call the ones you want
	the script to manipulate something starting with "FlameLight"
	
	This script should come as a Model with a lamp that will act as an example.
	
	HINT: This script was meant to control any number of lights, you don't need to use
	one script per light, just make sure all the lights are children of this scripts parent.
	
	Using only one copy of this script improves performance, the only reason you will
	will need more than one copy of it in your Place is if you need to run lights
	with different configuration settings.
	
-----------------------------------------------------------------------------------------
	CONFIGURATION
	
	The script will work with Brightness, Color and Range of the PointLights it finds so 
	be sure to set those appropriately. The 3 script settings that will affect all lights are:
	
	strength: 0-1 How strongly the script effects the light. For a subtlety set this bellow .5, 
	for a bold effect (for a haunted house or to simulate a torch) set it around .8
	
	agitation: 0-1 How quickly and strongly the light wavers. As with strength numbers below .5
	will be subtle while around .8 will be frantic.
	
	flickerRate: 0-1 Occasionally the a will flicker rapidly (a simulation of guttering
	which happens when a wick is too long or when the draw gets too strong). This adds a more
	realistic feel to the light, but it can be too much. Keep it below .75 generally. If you 
	have many of these lights in close proximity you might want to turn it down even further.

--]]


local Lighting = game:GetService("Lighting")

-- CONFIGURATION

local strength = .25
local agitation = .45
local flickerRate = .75

-- UTILITIES

local function CallOnChildren(Instance, FunctionToCall)
	-- Calls a function on each of the children of a certain object, using recursion.  

	FunctionToCall(Instance)

	for _, Child in next, Instance:GetChildren() do
		CallOnChildren(Child, FunctionToCall)
	end
end

function round(num) 
	return math.floor(num + 0.5) 
end

function getTimeInMilliseconds()
	return round(tick() * 1000)
end

function startsWith(String, Start)
   return string.sub(String, 1, string.len(Start)) == Start
end

-- AGITATION

function getAgitationSpread(agitation)
	local Point = {}
	Point.__index = Point
	function Point.new(x, y)
	  local self = setmetatable({}, Point)
	  self.x = x
		self.y = y
	  return self
	end
	
	local Line = {}
	Line.__index = Line
	function Line.new(s, e, m)
		local self = setmetatable({}, Line)
		self.s = s
		self.e = e
		self.m = m
		return self
	end
	
	local function lerp(line, t) 
		line.m.x = line.s.x + t * (line.e.x - line.s.x)
		line.m.y = line.s.y + t * (line.e.y - line.s.y)
	end
	
	local aPoint = 100 - round(100 * agitation)
	local line1 = Line.new(Point.new(0, 0), Point.new(aPoint, 100 - aPoint), Point.new(0, 0))
	local line2 = Line.new(Point.new(aPoint, 100 - aPoint), Point.new(100, 100),Point.new(0, 0))
	local bLine = Line.new(line1.m, line2.m, Point.new(0, 0))
	
	local function getPointAt(t) 
		lerp(line1, t)
		lerp(line2, t)
		lerp(bLine, t)
		return bLine.m
	end
	
	local agitationSpread = {}
	
	for i = 0, 1, .001 do
		local p = getPointAt(i)
		agitationSpread[round(p.x)] = round(p.y) / 100
	end
	
	return agitationSpread
end

local Flame = {}
Flame.__index = Flame
function Flame.new(maxDepth, agitation, flickerRate, light, brightness, range)
  local self = setmetatable({}, Flame)
	self.maxDepth = maxDepth
	self.agitation = agitation
	self.flickerRate = flickerRate
	
	self.light = light
	self.brightness = brightness
	self.range = range
	
	self.direction = 1
	
	self.agitationSpread = getAgitationSpread(agitation)
	
	self.maxDriftLengthSeconds = 1500
	self.curDriftRateSeconds = 1500
	
	self.baseStability = 1 - agitation
	
	self.mode = 0
	
	self.maxFlickerTime = .2
	self.minFlickerTime = .05
	self.maxFlickeringLength = 4000
	self.flickerDriftRate = 0
	self.curFlickerDriftPos = 1 - self.maxDepth
	self.flickerStartTime = 0
	self.flickerLength = 0
	
	-- setup initial state
	
	self.flickerTriggerSeconds = getTimeInMilliseconds() + 60000 * (1-self.flickerRate) + math.random() * 60000 * (1-self.flickerRate)
	self.curDriftRateSeconds = self.maxDriftLengthSeconds * self.baseStability + self.maxDriftLengthSeconds * math.random() * self.baseStability
	self.startTime = tick()
	self.curMaxDepth = self.maxDepth * self.agitationSpread[round(100*math.random())]
  return self
end

local flames = {}

local running = true

local pastTime = getTimeInMilliseconds()
local Parent = script.Parent

CallOnChildren(Parent, function(Part)
	if Part:IsA("PointLight") and startsWith(Part.Name, "FlameLight") then
		-- print "Found flame light, attaching Flame."
		table.insert(flames, 1, Flame.new(Part.Brightness * strength, agitation, flickerRate, Part, Part.Brightness, Part.Range))
	end
end)

print("Found ", #flames, " flame(s).")

while running do
	local now = getTimeInMilliseconds()
	local delta = now - pastTime
	pastTime = now
	
  for _, f in ipairs(flames) do

	  local curPos = (now - f.startTime) / f.curDriftRateSeconds

		if (f.mode == 0) then
      local curPosClean = math.min(curPos, 1)
            
      local sin = math.sin(curPosClean * math.pi); 

      local curMod = f.direction * (sin * f.curMaxDepth)
     
			f.light.Brightness = f.brightness + curMod
			f.light.Range = f.range + curMod
			
			-- print("Flickering! ", f.light.Name, " to ", newColor.r, ", ", newColor.g, ", ", newColor.b)

      if (curPos >= 1) then
        f.curDriftRateSeconds = f.maxDriftLengthSeconds * f.baseStability + f.maxDriftLengthSeconds * math.random() * f.baseStability
        local nextAgitation = f.agitationSpread[round(100 * math.random())]
				f.curMaxDepth = f.maxDepth * nextAgitation
        f.startTime = now
				f.direction = math.random() > .5 and 1 or -1
      end
      
      if (now > f.flickerTriggerSeconds) then
        f.mode = 1
        f.curMaxDepth = f.maxDepth * .2 + f.maxDepth * (f.agitation * (1 - math.sin(math.pi * math.random())))
        f.curDriftRateSeconds = f.maxFlickeringLength * f.baseStability + f.maxFlickeringLength * math.random() * f.baseStability
        f.flickerDriftRate = (2 + 2 * f.agitation) * 1000
        f.curFlickerDriftPos = .5 * math.pi
        f.flickerStartTime = now
				f.startTime = now
        f.flickerLength = 1250 * (f.minFlickerTime + math.sin(f.curFlickerDriftPos) * f.maxFlickerTime)
      end
	  elseif (f.mode == 1) then
      local ramp = math.min((now - f.flickerStartTime) / f.flickerLength, 1)
              
      local sin = math.sin((ramp) * math.pi/2)

      -- console.debug(sin);

      local curMod = f.maxDepth * .75 - (sin * f.curMaxDepth)

			f.light.Brightness = f.brightness - curMod
			f.light.Range = f.range - curMod

			-- print("Flickering! ", curMod)

      if (ramp == 1) then
          f.flickerStartTime = now
          local curDrift = f.curFlickerDriftPos + ((now - f.startTime) / f.flickerDriftRate) * math.pi
          f.flickerLength = 1250 * (f.minFlickerTime + math.abs(math.sin(curDrift)) * f.maxFlickerTime)
      end
      
      if (curPos >= 1 and ramp == 1) then
        f.mode = 0
        f.flickerTriggerSeconds = now + 60000 * (1-f.flickerRate) + math.random() * 60000 * (1-f.flickerRate)
        f.curDriftRateSeconds = f.maxDriftLengthSeconds * f.baseStability + f.maxDriftLengthSeconds * math.random() * f.baseStability
        f.curMaxDepth = f.maxDepth * .2 + f.maxDepth * (f.agitation * (1 - math.sin(math.pi * math.random())))
        f.startTime = now
      end
		end
	end
	wait(.01)
	-- running = false		
end

