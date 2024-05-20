local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local RunService = game:GetService("RunService")
local Transitions = require(script:WaitForChild("Transitions"))
local Loader = require(script:WaitForChild("Loader"))

local ContentBox = script.Parent.ContentBox
local ContentWrapper = ContentBox.Wrapper

-- Loading System
spawn( function( )
	local loadingComments = Loader.LoadGui()
	
	if loadingComments.Success == false then
		Transitions.TransitionTo(ContentWrapper[ loadingComments.Message ])
	else
		Transitions.TransitionTo(ContentWrapper.Payment)
	end
end)

-- Enable Loading Screen if not in studio
if not RunService:IsStudio() then
	for _, v in pairs( ContentWrapper:GetChildren() ) do
		if not v:IsA("Frame") then continue end

		v.Visible = false
	end
	ContentWrapper.Loading.Visible = true
	ContentBox.Size = ContentWrapper.Loading:GetAttribute("Size")
end

-- Teleport GUI
TeleportService:SetTeleportGui( script.Parent )

-- External Transitions
ReplicatedStorage.Events.CtC.TransitionToFrameByName.Event:Connect( function( name )
	Transitions.TransitionTo(ContentWrapper[ name ])
end)

-- Payment Transitions
MarketplaceService.PromptProductPurchaseFinished:Connect(function( player, assetId, isPurchased )
	print(isPurchased)
	
	if isPurchased then
		Transitions.TransitionTo(ContentWrapper.PaymentSuccess)
	else
		Transitions.TransitionTo(ContentWrapper.Payment)
	end
end)