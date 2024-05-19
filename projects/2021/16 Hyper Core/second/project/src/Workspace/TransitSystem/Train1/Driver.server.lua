local Routes999 = {
	"000",
	"001", 
	"002",
	"003",
	"004",
	"005",
	"006",
	"007",
	"008",
	"009",
	"010",
	"011",
	"012",
	"013",
	"014",
	"015",
	"016",
	"017",
	"018",
	"019",
	"020",
	"021",
	"022",
	"023",
	"024",
	"025",
	"026",
	"027",
	"028",
	"029",
	"030",
	"031",
	"032",
	"033",
	"034",
	"035",
	"036",
	"037",
	"038",
	"039",
	"040",
	"041",
	"042",
	"043",
	"044",
	"045",
	"046",
	"047",
	"048",
	"049",
	"050",
	"051",
	"052",
	"053",
	"054",
	"055",
	"056",
	"057",
	"058",
	"059"
}

createRailOutlines = true

local TweenService = game:GetService("TweenService")

TrainOnDrive = false
Train = script.Parent.train
RootPart = Train.Root

if createRailOutlines == true then
	outline = Instance.new("SelectionBox")
	outline.Color3 = Color3.new(1, 0, 0)
	outline.Parent = script
	
	prevoutline = Instance.new("SelectionBox")
	prevoutline.Color3 = Color3.new(1, 0.968627, 0)
	prevoutline.Parent = script
	
	nextoutline = Instance.new("SelectionBox")
	nextoutline.Color3 = Color3.new(0, 0.180392, 1)
	nextoutline.Parent = script
end

function DriveRoute999(StartPos)
	script.Parent.train.Root.Sound.Playing = true
	local PanelSlideInfo = TweenInfo.new(0)

	local PanelSlideTween = TweenService:Create(RootPart, PanelSlideInfo, {
		CFrame = workspace.TransitSystem.Rails:FindFirstChild("rail"..Routes999[1]).CFrame
	})

	PanelSlideTween:Play()
	
	print("Route Lenght: ".. #Routes999.. " rails.")
	
	local routelenght = #Routes999
	script.Parent.linenumber.Value = 999
	script.Parent.NextStation.Value = "Developer Train"
	
	wait(1)
	

	
	
	for i = 2, routelenght do
		
		
		local routeTable = Routes999
		local TrainOnRail = routeTable[i-1]
		local TrainWasOnRail = routeTable[i-2]
		local TrainMoveToRail = routeTable[i]
		
		local TrainOnRailIns = workspace.TransitSystem.Rails:FindFirstChild("rail".. TrainOnRail)
		
		local SlowRail = TrainOnRailIns:GetAttribute("slow")
		local FastRail = TrainOnRailIns:GetAttribute("fast")
		local StationRail = TrainOnRailIns:GetAttribute("station")
		
		local NextStationRail = workspace.TransitSystem.Rails:FindFirstChild("rail".. TrainMoveToRail):GetAttribute("station") 
		
		local speed = 8
		script.Parent.train.Root.Sound.PlaybackSpeed = 1
		if SlowRail == true then
			speed = speed / 3
			script.Parent.train.Root.Sound.PlaybackSpeed = .5
		end

		if FastRail == true then
			speed = speed * 2
			script.Parent.train.Root.Sound.PlaybackSpeed = 2
		end
		
		local WaitTime = ( workspace.TransitSystem.Rails:FindFirstChild("rail".. TrainOnRail).Position - workspace.TransitSystem.Rails:FindFirstChild("rail".. TrainMoveToRail).Position).magnitude / speed
		
		if TrainWasOnRail == nil then
			TrainWasOnRail = routeTable[1]
		end
		
		if createRailOutlines == true then
			outline.Adornee = TrainOnRailIns
			nextoutline.Adornee = workspace.TransitSystem.Rails:FindFirstChild("rail".. TrainMoveToRail)
			if workspace.TransitSystem.Rails:FindFirstChild("rail".. TrainWasOnRail) then
				prevoutline.Adornee = workspace.TransitSystem.Rails:FindFirstChild("rail".. TrainWasOnRail)
			end
		end
		
		
		
		if StationRail == false then
			local TweenInformation = 0
			if NextStationRail == true then
				TweenInformation = TweenInfo.new(WaitTime * 2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
				script.Parent.train.Root.Sound.PlaybackSpeed = .5
				script.Parent.train.Root.Sound.Playing = false
				wait()
				script.Parent.train.Root.Sound.Playing = true
			else
				TweenInformation = TweenInfo.new(WaitTime, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
			end
			
			
			local TrainMoveTween = TweenService:Create(RootPart, TweenInformation, {
				CFrame = workspace.TransitSystem.Rails:FindFirstChild("rail".. TrainMoveToRail).CFrame
			})
			TrainMoveTween:Play()
			
			if NextStationRail == true then
				wait(WaitTime * 2)
			else
				wait(WaitTime)
			end
			
		else
			
			script.Parent.train.Root.Sound.Playing = false
			wait(1)
			
			local speed = 8
			script.Parent.train.Root.Sound.PlaybackSpeed = 1
			if SlowRail == true then
				speed = speed / 3
				script.Parent.train.Root.Sound.PlaybackSpeed = .5
			end

			if FastRail == true then
				speed = speed * 2
				script.Parent.train.Root.Sound.PlaybackSpeed = 2
			end
			local WaitTime = ( workspace.TransitSystem.Rails:FindFirstChild("rail".. TrainOnRail).Position - workspace.TransitSystem.Rails:FindFirstChild("rail".. TrainMoveToRail).Position).magnitude / speed
			
			local doorRoot = script.Parent.train.DoorRoot
			local TweenInformation = TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
			
			doorRoot.Anchored = true
			
			local DoorTween = TweenService:Create(doorRoot, TweenInformation, {
				CFrame = doorRoot.CFrame * CFrame.new(0, 0, - doorRoot.Size.Z + 0.10)
			})
			DoorTween:Play()
			wait(7.5)
			doorRoot.close:Play()
			wait(doorRoot.close.TimeLength)
			local DoorTween = TweenService:Create(doorRoot, TweenInformation, {
				CFrame = doorRoot.CFrame * CFrame.new(0, 0, doorRoot.Size.Z - 0.10)
			})
			DoorTween:Play()
			wait(2)
			script.Parent.train.Root.Sound.Playing = true
			script.Parent.train.Root.Sound.PlaybackSpeed = .5
			doorRoot.Holder.Enabled = true
			doorRoot.Anchored = false
			
			TweenInformation = TweenInfo.new(WaitTime * 2, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
			local TrainMoveTween = TweenService:Create(RootPart, TweenInformation, {
				CFrame = workspace.TransitSystem.Rails:FindFirstChild("rail".. TrainMoveToRail).CFrame
			})
			TrainMoveTween:Play()
			wait(WaitTime * 2)
			
		end
	end
end

wait(3)

DriveRoute999(000)