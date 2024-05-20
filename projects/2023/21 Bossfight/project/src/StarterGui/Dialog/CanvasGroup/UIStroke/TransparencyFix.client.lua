script.Parent.Parent:GetPropertyChangedSignal("GroupTransparency"):Connect(function()
	script.Parent.Transparency = script.Parent.Parent.GroupTransparency
end)
script.Parent.Transparency = script.Parent.Parent.GroupTransparency