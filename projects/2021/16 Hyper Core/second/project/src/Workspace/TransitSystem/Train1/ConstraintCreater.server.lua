local Train = script.Parent.train --Path to the Model that u want to weld--

local Part1 = Train.Root -- !! NAME THE MAIN PART "Root" !! --

for _, Part0 in pairs(Train:GetChildren()) do
	if Part0:IsA("BasePart") and not (Part0 == Part1) then
		if not string.find(Part0.Name, "Door") then
			local WeldConstraint = Instance.new("WeldConstraint")
			WeldConstraint.Part0 = Part0
			WeldConstraint.Part1 = Part1
			WeldConstraint.Parent = WeldConstraint.Part0

			Part0.Anchored = false
		end
	end
end

Part1.Anchored = true
Part1.CanCollide = false