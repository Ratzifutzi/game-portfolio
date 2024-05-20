TweenService = game:GetService("TweenService")

HoverTweenInfo = TweenInfo.new( .3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out )
ClickTweenInfo = TweenInfo.new( .1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut, 0 ,true )

local ROOT = script.Parent.Holder.Wrapper

for k, button: TextButton in pairs( ROOT.Navigation:GetChildren() ) do
	if not button:IsA("TextButton") then continue end
	
	button.MouseButton1Click:Connect(function()
		ROOT.ContentPages.UIPageLayout:JumpTo( ROOT.ContentPages[ button.Name ] )
		ROOT.TitlePages.UIPageLayout:JumpTo( ROOT.TitlePages[ button.Name ] )
	end)
	
	-----------------------------------
	button.MouseEnter:Connect(function()
		local target = {
			Size = UDim2.new(0.475, 5, 1, -5),
			BackgroundTransparency = 0.5
		}

		TweenService:Create( button, HoverTweenInfo, target ):Play()
		task.wait( HoverTweenInfo.Time )
		button.Size = target.Size
	end)
	
	button.MouseLeave:Connect(function()
		local target = {
			Size = UDim2.new(0.475, 0, 1, 0),
			BackgroundTransparency = 0
		}
		
		TweenService:Create( button, HoverTweenInfo, target ):Play()
		task.wait( HoverTweenInfo.Time )
		button.Size = target.Size
	end)
	
	button.MouseButton1Click:Connect(function()
		TweenService:Create( button, ClickTweenInfo, {
			Size = UDim2.new(0.475, -10, 1, -10),
		} ):Play()
	end)
end

ROOT.ContentPages.UIPageLayout:JumpTo( ROOT.ContentPages:WaitForChild("RobuxDonations") )
ROOT.TitlePages.UIPageLayout:JumpTo( ROOT.TitlePages:WaitForChild("RobuxDonations") )