--[[

		Player Rank Display v.1.0.1
			Slayer219
		December 15, 2012

]]--


-- VARS --

--[[local ranks = {
	['s00per lidear'] = 255; --pattern ['rank'] = permission level (get both from group admin page!)
	['ok this mod'] = 254;
	['who u? ok.'] = 1;
};]] --for old version

local groupID = 8623855; --change groupID to your group ID
local before_name = true; --true if you want the player's rank displayed before their name, false if you want it displayed after.
local ts = tostring

-- REMOVE NAME, FIND RANK --

game.Players.PlayerAdded:connect(function(player)
repeat wait() until player.Character
	local char = player.Character
	getRole(player)
	player.Changed:connect(function()
		repeat wait() until player.Character
			wait()
			getRole(player)
	end)
end)

-- CREATE CUSTOM TITLE --

function createTitle(p, s)
	local gui = script.BillboardGui
	local clone = gui:Clone()
	clone.Parent = p.Character.Head
	local plr = game.Players:GetPlayerFromCharacter(p.Character)
	if before_name then
		clone.DisplayName.Text = p.DisplayName
		clone.UserName.Text = "@" .. p.Name
		clone.Rank.Text = s
		--clone.PlayerToHideFrom = p
		if workspace.TitlePrefix:FindFirstChild(plr.Name) then
			local title = workspace.TitlePrefix:FindFirstChild(plr.Name).String.Value
			local color = workspace.TitlePrefix:FindFirstChild(plr.Name).Color.Value
			clone.Rank.Text = title
			clone.Rank.TextColor3 = color
		end
	end
end

function getRole(player)
	player.Character.Humanoid.NameOcclusion = "OccludeAll"
	if player.Character.Head:findFirstChild("Title") then
		return false
	elseif not player.Character.Head:findFirstChild("Title") and player:IsInGroup(groupID) then
		local rankString = player:GetRoleInGroup(groupID)
		--[[for i, v in pairs(ranks) do
			if rank_num == v then
				local rankString = i
				createTitle(player, rankString)
			else 
				print("No rank specified for the permission level "..ts(rank_num))
				createTitle(player, "")
			end
		end]]
		createTitle(player, rankString)
	elseif not player:IsInGroup(groupID) then
		print("Player is not in group "..ts(groupID))
		createTitle(player, "Guest")
	end
end

-- DONE --