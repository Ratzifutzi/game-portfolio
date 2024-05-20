local AssetService = game:GetService("AssetService")
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ContentProvider = game:GetService("ContentProvider")

local Root = Players.LocalPlayer.PlayerGui:WaitForChild("Main")

local ContentWrapepr = Root.ContentBox.Wrapper
local LoadingPage = ContentWrapepr.Loading

local module = {}

function module.LoadGui()
	local loadingComments = {
		["Success"] = true,
		["Message"] = nil
	}
	
	LoadingPage["0_ImageGallery"].UIPageLayout:JumpTo( LoadingPage["0_ImageGallery"]["0"])
	ContentProvider:PreloadAsync( game.Players.LocalPlayer.PlayerGui:GetDescendants() )
	
	task.wait(2.5)
	
	repeat wait() until workspace.Values.Ready.Value
	
	-- Payment active
	if Players.LocalPlayer["ActivePayment"].Value == 0 then
		loadingComments.Success = false
		loadingComments.Message = "NoPayment"
	end
	
	-- Animation
	LoadingPage["0_ImageGallery"].UIPageLayout:JumpTo( LoadingPage["0_ImageGallery"]["2"])
	
	local MoveTweenInfo = TweenInfo.new( .5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut )
	TweenService:Create( LoadingPage["1_Title"], MoveTweenInfo, {
		TextTransparency = 1,
		Size = UDim2.fromScale(0, 0)
	}):Play()
	TweenService:Create( LoadingPage["0_ImageGallery"], MoveTweenInfo, {
		Size = UDim2.fromScale( .8, .8 ),
		Position = UDim2.fromScale( .5, .5 ),
		AnchorPoint = Vector2.new(.5, .5),
	}):Play()
	
	task.wait( LoadingPage["0_ImageGallery"].UIPageLayout.TweenTime + 1 )
	
	return loadingComments
end

return module
