local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local LastUpdate = tick()

local function Refresh()
	local currentData = ReplicatedStorage.Functions.CtS.RequestDonationLeaderboard:InvokeServer()
	
	-- Clean Up
	for k, v in pairs( script.Parent:GetChildren() ) do
		if not v:IsA("Frame") then continue end

		v:Destroy()
	end

	-- Place new frames
	for key, data in pairs( currentData ) do
		local clone = script.Mother:Clone()

		clone.Earned.Text = string.format( clone.Earned:GetAttribute("OriginalText"), data.value * 0.7 )
		clone.PlayerName.Text = string.format( clone.PlayerName:GetAttribute("OriginalText"), Players:GetNameFromUserIdAsync( data.key ) )
		clone.Rank.Text = string.format( clone.Rank:GetAttribute("OriginalText"), key )
		clone.Spent.Text = string.format( clone.Spent:GetAttribute("OriginalText"), data.value )

		clone.Parent = script.Parent
	end
end
Refresh()
ReplicatedStorage.Events.StC.DonationBoardUpdate.OnClientEvent:Connect( Refresh )

RunService.Stepped:Connect(function( dt )
	if tick() - LastUpdate < 30 then return end
	LastUpdate = tick()
	
	Refresh()
end)