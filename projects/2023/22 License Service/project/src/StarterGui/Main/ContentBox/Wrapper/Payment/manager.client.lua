local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local ContentProvider = game:GetService("ContentProvider")
local Transitions = require(Players.LocalPlayer.PlayerGui:WaitForChild("Main"):WaitForChild("manager"):WaitForChild("Transitions"))

local Root = script.Parent

-- Player Icon
spawn( function()
	local content, isReady = Players:GetUserThumbnailAsync( Players.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size180x180 )
	ContentProvider:PreloadAsync( {content} )
	
	Root.PlayerProfilePic.Image = content
end)

-- Texts
Root.Title.Text = string.format( Root.Title.Text, Players.LocalPlayer.DisplayName )

-- Button
Root.Pay.MouseButton1Click:Connect(function()
	MarketplaceService:PromptProductPurchase( Players.LocalPlayer, Players.LocalPlayer["ActivePayment"].Value )
	
	Transitions.TransitionTo( Root.Parent.Loading )
end)

-- Texts Delayed
script.Parent:GetPropertyChangedSignal("Visible"):Connect(function()
	local assetInfo = MarketplaceService:GetProductInfo( Players.LocalPlayer["ActivePayment"].Value, Enum.InfoType.Product )

	Root.Pay.TextLabel.Text = string.format( "\u{E002} <b>%i</b>", assetInfo.PriceInRobux )
end)