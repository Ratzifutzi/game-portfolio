i = 0
while true do
	wait(.01)
	i = i - .5
	script.Parent.Rotation = i
	script.Parent.BackgroundColor3 = workspace.Values.Core.StatusColor.Value
end