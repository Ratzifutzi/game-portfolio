oldName = script.Parent.name.Text
oldSubText = script.Parent.SubText.Text
script.Parent.name.Text = ""
script.Parent.SubText.Text = ""

script.Parent.Visible = true

function TypeWriter(obj, text)
	for i = 1, #text,1 do
		wait(.1)
		obj.Text = string.sub(text,1,i) .. "_"
		script.Parent.Type.PitchShiftSoundEffect.Octave = math.random(75, 150) / 100
		script.Parent.Type:Play()
	end
end



workspace.Events.Intro.Lab.FireToLocal.OnClientEvent:Connect(function()
	wait(8)
	TypeWriter(script.Parent.name, oldName)
	script.Parent.name.Text = oldName

	wait(2)

	TypeWriter(script.Parent.SubText, oldSubText)
	script.Parent.SubText.Text = oldSubText
	
	wait(5)
	script.Parent.name.Text = ""
	script.Parent.SubText.Text = ""
	script.Parent.End:Play()
end)