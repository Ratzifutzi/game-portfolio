local pln = script.Parent 

local function WeldTogether(Part0, Part1, JointType, WeldParent)
	--- Weld's 2 parts together
	-- @param Part0 The first part
	-- @param Part1 The second part (Dependent part most of the time).
	-- @param [JointType] The type of joint. Defaults to weld.
	-- @param [WeldParent] Parent of the weld, Defaults to Part0 (so GC is better).
	-- @return The weld created.
 
	JointType = JointType or "Weld"
 
	local NewWeld = Instance.new(JointType)
	NewWeld.Part0  = Part0;
	NewWeld.Part1  = Part1;
	NewWeld.C0     = CFrame.new();
	NewWeld.C1     = Part1.CFrame:toObjectSpace(Part0.CFrame);
	NewWeld.Parent = WeldParent or Part0;
 
	return NewWeld
end

local p = script.Parent
WeldTogether(p.Lantern, p.Cap)
WeldTogether(p.Lantern, p.Glass)
WeldTogether(p.Pole, p.Lantern)
WeldTogether(p.Pole, p.Cone)
WeldTogether(p.Cap, p.Finial)
WeldTogether(p.Pole, p.Flame)
