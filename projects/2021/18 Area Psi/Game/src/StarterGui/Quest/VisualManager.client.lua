Objectives_Before = 0
local TI = TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
local textTI = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local TS = game:GetService("TweenService")

script.Parent.SideBar.Position = UDim2.new(1,0,0,20)
script.Parent.FrameQuestExample.Visible = false

BarInTween = TS:Create(script.Parent.SideBar, TI, {BackgroundTransparency = 0})
BarOutTween = TS:Create(script.Parent.SideBar, TI, {BackgroundTransparency = 1})

workspace.ObjectiveService.Objectives.DescendantAdded:Connect(function(Descendant)
	if Descendant:IsA("Folder") then
		local Active_Quests = #workspace.ObjectiveService.Objectives:GetChildren()
		local OldSideBarSizeOffsetY = script.Parent.SideBar.Size.Y.Offset
		local FrameToCopy = script.Parent.FrameQuestExample:Clone()
		if Active_Quests == 1 then
			FrameToCopy.Position = UDim2.new(0.8,20,0,script.Parent.SideBar.Size.Y.Offset + 20)
			script.Parent.SideBar.Size = UDim2.new(0,2,0,OldSideBarSizeOffsetY + FrameToCopy.Text.Size.Y.Offset + FrameToCopy.Progress.AbsoluteSize.Y)
		elseif Active_Quests > 1 then
			FrameToCopy.Position = UDim2.new(0.8,20,0,script.Parent.SideBar.Size.Y.Offset + 30)
			script.Parent.SideBar.Size = UDim2.new(0,2,0,OldSideBarSizeOffsetY + FrameToCopy.Text.Size.Y.Offset + FrameToCopy.Progress.AbsoluteSize.Y + 10)
		end
		FrameToCopy.Name = Descendant.Name
		FrameToCopy.Parent = script.Parent
		FrameToCopy.Text.Text = Descendant.Text.Value
		FrameToCopy.Text.TextTransparency = 1
		if Active_Quests == 1 and Objectives_Before == 0 then
			script.Parent.SideBar.BackgroundTransparency = 1
			BarInTween:Play()
			script.Parent.SideBar:TweenPosition(UDim2.new(.8, 0, 0, 20), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 1, true)
			wait(1.5)
		end
		local TextInTween = TS:Create(FrameToCopy.Text, textTI, {TextTransparency = 0})
		local TextOutTween = TS:Create(FrameToCopy.Text, textTI, {TextTransparency = 1})
		TextInTween:Play()
		FrameToCopy.Visible = true
		Objectives_Before = Active_Quests
	end
end)