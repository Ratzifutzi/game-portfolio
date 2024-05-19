function TypeWriter(obj, text, sleeptime)
	for i = 1, #text,1 do
		wait(sleeptime)
		obj.Text = string.sub(text,1,i) .. "_"
	end
end

script.Parent.StartAnimation.Event:Connect(function()
	script.Parent.Frame.Frame.Visible = false
	script.Parent.Frame.TextLabel.Text = ""
	script.Parent.Keyboard.Visible = true
	script.Parent.NameToVerify.Text = "_"
	
	
	TypeWriter(script.Parent.NameToVerify, "Ratzifutzi", .1)
	
	wait(.5)
	
	script.Parent.Keyboard.Visible = false
	wait(1)
	TypeWriter(script.Parent.Frame.TextLabel, "gdgdsagdgdsa gds gds g dsa gds gdsagdsgdsgdasgdsgdsa gds dgsgdsagdsgdsgdsagdsa gdsagdsdgsadgsadgsahgdgsakhdgsha gdsagdsaghds dgsagdsajhgdakgdsa dggdsahdgasjhkgdsahkdgashdgahsjklgdsajkhdgsahljkdgsahjl dgdgsahjdgsajhlkdgsahjlgjhdsadgsahjvbjndsjhgd dgshgdsjhakgdsjhakhjgkdsajkbvdsajkhhjgfdsa fdshgdhjgdjhkdgsjkhvjkhadshj fdshgdsjkgds dshgdjksalvhbdsajk dshgjkhdsa fdsjhdsjhgdsjjhdslkag")
	wait(1)
	script.Parent.Frame.Frame.Visible = true
	wait(.05)
	script.Parent.Frame.Frame.Visible = false
	wait(.05)
	script.Parent.Frame.Frame.Visible = true
	wait(.05)
	script.Parent.Frame.Frame.Visible = false
	wait(.05)
	script.Parent.Frame.Frame.Visible = true
	wait(.05)
	script.Parent.Frame.Frame.Visible = false
	wait(.5)
	script.Parent.Frame.Frame.Visible = true
	
	
end)

wait(5)

script.Parent.StartAnimation:Fire()