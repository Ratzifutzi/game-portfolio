
local VALUE_INSTANCE : BoolValue = game.Players.LocalPlayer:WaitForChild("UserData"):WaitForChild("InBossFight")

VALUE_INSTANCE:GetPropertyChangedSignal("Value"):Connect(function( value : boolean )
	script.Parent.Enabled = VALUE_INSTANCE.Value
end)
script.Parent.Enabled = VALUE_INSTANCE.Value