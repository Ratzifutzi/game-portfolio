lb1 = script.Parent.train.lihtbar1front
lb2 = script.Parent.train.lihtbar2front
l1 = script.Parent.train.light1front
l2 = script.Parent.train.light2front

workspace.Lights.Type.Changed:Connect(function()
	if workspace.Lights.Type.Value == "normal" then
		l1.Color = Color3.new(0.992157, 0.917647, 0.552941)
		l2.Color = Color3.new(0.992157, 0.917647, 0.552941)
		lb1.Color = Color3.new(1, 1, 0)
		lb2.Color = Color3.new(0.972549, 0.85098, 0.427451)
	elseif workspace.Lights.Type.Value == "alert" then
		while  workspace.Lights.Type.Value == "alert" do
			l1.Color = Color3.new(0.992157, 0.239216, 0.239216)
			l2.Color = Color3.new(0.435294, 0.101961, 0.101961)
			lb1.Color = Color3.new(0.992157, 0.239216, 0.239216)
			lb2.Color = Color3.new(0.435294, 0.101961, 0.101961)
			wait(.75)
			l2.Color = Color3.new(0.992157, 0.239216, 0.239216)
			l1.Color = Color3.new(0.435294, 0.101961, 0.101961)
			lb2.Color = Color3.new(0.992157, 0.239216, 0.239216)
			lb1.Color = Color3.new(0.435294, 0.101961, 0.101961)
			wait(.75)
		end
	end
end)