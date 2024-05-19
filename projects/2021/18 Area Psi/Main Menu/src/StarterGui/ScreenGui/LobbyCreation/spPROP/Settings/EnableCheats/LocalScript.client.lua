script.Parent.Click.MouseButton1Click:Connect(function()
	local plr = game.Players.LocalPlayer
	local mps = game:GetService("MarketplaceService")
	
	if game.Players.LocalPlayer.DevCon.Value == true then
		if script.Parent.Text == "X" then
			script.Parent.Text = ""
		else
			script.Parent.Text = "X"
		end
	else
		if plr.MembershipType == Enum.MembershipType.Premium then
			mps:PromptProductPurchase(plr, 1205474685)
			for i = 0, 20 do
				wait(.75)
				if game.Players.LocalPlayer.DevCon.Value == true then
					script.Parent.Text = "X"
					break
				end
			end
		else
			mps:PromptProductPurchase(plr, 1205474095)
			for i = 0, 20 do
				wait(.75)
				if game.Players.LocalPlayer.DevCon.Value == true then
					script.Parent.Text = "X"
					break
				end
			end
		end
	end
end)