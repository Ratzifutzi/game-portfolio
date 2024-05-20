ReplicatedStorage = game:GetService("ReplicatedStorage")
TweenService = game:GetService("TweenService")

DamageModule = require( script.Parent.Damage )

local module = {}

function module.Spawn( patternToUse : Model )
	local patternRoot = workspace.Interactive.BossFight.Patterns
	local patterns = ReplicatedStorage.BossPatterns
	
	local highlight = patternRoot.Highlight
	local clone = patternToUse:Clone()
	
	for k, part : BasePart in pairs( clone:GetDescendants() ) do
		if not part:IsA("BasePart") then continue end
		
		part.Anchored = true
		part.Material = Enum.Material.Glass
		part.Transparency = 0.5
		part.Color = Color3.new(1, 0, 0)
		part.CanCollide = false
		part.CastShadow = false
	end
	
	clone.Parent = patternRoot
	
	highlight.Adornee = clone
	
	highlight.FillTransparency = 1
	highlight.OutlineTransparency = 1
	
	local fadeInPrepare = TweenService:Create( highlight, TweenInfo.new(workspace.Values.PatternChargeTime.Value, Enum.EasingStyle.Linear), {
		FillTransparency = .5,
		OutlineTransparency = .5
	} ) fadeInPrepare:Play()
	fadeInPrepare.Completed:Wait()
	
	local flashInOut = TweenService:Create( highlight, TweenInfo.new(.1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut, 0, false), {
		FillTransparency = 0,
		OutlineTransparency = 0
	} ) flashInOut:Play()
	flashInOut.Completed:Wait()
	
	------------------------------------
	DamageModule.DealDamage()
	------------------------------------
	
	local fadeOutPrepare = TweenService:Create( highlight, TweenInfo.new(.5, Enum.EasingStyle.Linear), {
		FillTransparency = 1,
		OutlineTransparency = 1
	} ) fadeOutPrepare:Play()
	fadeOutPrepare.Completed:Wait()
	
	clone:Destroy()
end

return module
