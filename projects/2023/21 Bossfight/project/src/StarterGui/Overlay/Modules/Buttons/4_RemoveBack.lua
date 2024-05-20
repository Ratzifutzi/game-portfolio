ReplicatedStorage = game:GetService("ReplicatedStorage")
Players = game.Players

local ROOT = script.Parent.Parent.Parent

local module = {}

function module.execute()
	repeat wait() until Players.LocalPlayer.Character

	for k, ins : Accessory in pairs( Players.LocalPlayer.Character:GetChildren() ) do
		if not ins:IsA("Accessory") then continue end

		if ins.AttachmentPos.X > 0.075 then
			ins:Destroy()
		end
	end
end

return module
