script.Parent.Root.ProximityPrompt.ActionText = script.Parent.Config.DoorNickName.Value
open = false
script.Parent.Root.ProximityPrompt.PromptButtonHoldEnded:Connect(function(plr)
	if script.Parent.Locked.Value == false and script.Parent.Modified.Value == false then
		script.Parent.Root.ProximityPrompt.Enabled = false
		Open()
		wait(5)
		Close()
		wait(2)
		script.Parent.Root.ProximityPrompt.Enabled = true
	end
end)

function Open()
	if open == false then
		open = true 
		script.Parent.Lamp.BrickColor = BrickColor.Green()
		local TweenService = game:GetService("TweenService")
		local Panel = script.Parent
		local PanelRoot = Panel.Root

		local PanelSlideInfo = TweenInfo.new(script.Parent.Root.DoorMove.TimeLength)
		script.Parent.Root.DoorMove:Play()
		local PanelSlideTween = TweenService:Create(PanelRoot, PanelSlideInfo, {
			CFrame = PanelRoot.CFrame * CFrame.new(0, 0, PanelRoot.Size.Z + 0.10)
		})

		PanelSlideTween:Play()
	end
end

function Close()
	if open == true then
		open = false
		script.Parent.Lamp.BrickColor = BrickColor.Red()
		local TweenService = game:GetService("TweenService")
		local Panel = script.Parent
		local PanelRoot = Panel.Root

		local PanelSlideInfo = TweenInfo.new(script.Parent.Root.DoorMove.TimeLength)
		script.Parent.Root.DoorMove:Play()
		local PanelSlideTween = TweenService:Create(PanelRoot, PanelSlideInfo, {
			CFrame = PanelRoot.CFrame * CFrame.new(0, 0, - PanelRoot.Size.Z - 0.10)
		})

		PanelSlideTween:Play()
	end
end

script.Parent.Locked.Changed:Connect(function()
	if script.Parent.Locked.Value == false then
		script.Parent.Lamp.BrickColor = BrickColor.new("New Yeller")
		script.Parent.Root.ProximityPrompt.ActionText = script.Parent.Config.DoorNickName.Value
	else
		script.Parent.Lamp.BrickColor = BrickColor.Red()
		script.Parent.Root.ProximityPrompt.ActionText = "LOCKED"
	end
end)

script.Parent.Modified.Changed:Connect(function()
	if script.Parent.Modified.Value == false then
		script.Parent.Lamp.BrickColor = BrickColor.new("New Yeller")
		script.Parent.Root.ProximityPrompt.ActionText = script.Parent.Config.DoorNickName.Value
	else
		script.Parent.Lamp.BrickColor = BrickColor.Blue()
		script.Parent.Root.ProximityPrompt.ActionText = "MODIFIED BY ADMIN"
	end
end)
