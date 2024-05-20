local MarketplaceService = game:GetService("MarketplaceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Transitions = require(game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main"):WaitForChild("manager"):WaitForChild("Transitions"))

MarketplaceService.PromptPurchaseFinished:Connect(function( plr, assetId, isPurchased )
	if not isPurchased then return nil end
	
	ReplicatedStorage.Events.CtC.TransitionToFrameByName:Fire( "Loading" )
	ReplicatedStorage.Events.CtS.Reconnect:FireServer()
end)