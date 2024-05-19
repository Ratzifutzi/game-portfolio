local self,player = script.Parent,game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:wait()
local humanoid = char:WaitForChild("Humanoid") -- waits for the humanoid in the character

local Head = workspace.CurrentCamera

Head.CFrame = Head.CFrame * CFrame.new(2,2,2)


function antiTrans(part)
	if part and part:IsA("BasePart") then -- checks if a part and is a arm
		part.LocalTransparencyModifier = part.Transparency
		part.Changed:connect(function (property)    
			part.LocalTransparencyModifier = part.Transparency--Changes the local modifyer(client side only)
		end)
	end
end

for _,v in pairs(char:GetChildren()) do
	antiTrans(v) -- adds all parts
end