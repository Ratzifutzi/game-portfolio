local IMAGES = {
	["NotFound"] = "rbxassetid://10723365987";
}

local Root = script
local Mothers = Root.Mothers

local Backpack = game.Players.LocalPlayer.Backpack

function UpdateInventory()
	local items = Backpack:GetChildren()
	
	--Empty UI
	for k, ins : Instance in pairs( Root.Parent["2_Content"]:GetChildren() ) do
		if ins:IsA("UIListLayout") then continue end
		
		ins:Destroy()
	end
	
	local totalWeight = 0
	for k, item : Tool in pairs( items ) do
		local c = Mothers.Tile:Clone()
		
		------------------------------------
		if not item.TextureId then
			warn("The item", item.Name, "misses an TextureId.")
			item.TextureId = IMAGES.NotFound
		end
		if not item:GetAttribute("Weight") then
			warn("The item", item.Name, "misses the Weight attribute. Weight has been locally set to 0")
			item:SetAttribute("Weight", 0)
		end
		------------------------------------
		
		c.Name = item.Name
		c.Icon.Image = item.TextureId
		c.ItemName.Text = item.Name
		c.Visible = true
		
		c.Parent = Root.Parent["2_Content"]
		
		totalWeight += item:GetAttribute("Weight")
	end
	
	Root.Parent.Weight.Value = totalWeight
	Root.Parent["1_Button"].Weight.Text = tostring(totalWeight) .. "/5"
	
	-- Add Empty Inventory Text
	if #items == 0 then
		local text = Mothers.EmptyText:Clone()
		text.Parent = Root.Parent["2_Content"]
	end
end
UpdateInventory()
Backpack.ChildAdded:Connect(UpdateInventory)
Backpack.ChildRemoved:Connect(UpdateInventory)

Root.Parent["1_Button"].Button.MouseButton1Click:Connect(function()
	Root.Parent["2_Content"].Visible = not Root.Parent["2_Content"].Visible
end)