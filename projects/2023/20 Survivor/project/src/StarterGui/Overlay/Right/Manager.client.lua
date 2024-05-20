local ROOT = script.Parent.Parent

local ACTIONS = {
	["01_build"] = function()
		ROOT.Inventory.Visible = not ROOT.Inventory.Visible
		ROOT.Buildings.Visible = not ROOT.Buildings.Visible
	end,
	["02_destroy"] = function()
		-- TODO
	end,
	["03_settings"] = function()
		-- TODO
	end,
}

for k : number, v : ImageButton in pairs( script.Parent:GetChildren() ) do
	if not v:IsA("ImageButton") then continue end
	
	v.MouseButton1Click:Connect(function()
		ACTIONS[ v.Name ]()
	end)
end