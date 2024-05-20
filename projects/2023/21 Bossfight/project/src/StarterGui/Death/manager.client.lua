ReplicatedStorage = game:GetService("ReplicatedStorage")
MarketplaceService = game:GetService("MarketplaceService")
Lighting = game:GetService("Lighting")
TweenService = game:GetService("TweenService")
RunService = game:GetService("RunService")

------------------------------------
script.Parent.Wrapper.Visible = false
------------------------------------

InTweenInfo = TweenInfo.new(2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
OutTweenInfo = TweenInfo.new(1.25, Enum.EasingStyle.Sine, Enum.EasingDirection.In)

local Root = script.Parent.Wrapper

local DEV_PRODUCTS = require( ReplicatedStorage.DevProducts )

local PurchaseGoing = false

Root:GetPropertyChangedSignal("Visible"):Connect(function()
	PurchaseGoing = false
	
	-- Update Price Text
	spawn(function()
		local productInfo = MarketplaceService:GetProductInfo( DEV_PRODUCTS.Products.Revive, Enum.InfoType.Product )
		
		Root.ReviveButton.TextLabel.Text = string.format( Root.ReviveButton.TextLabel:GetAttribute("OriginalText"), productInfo.PriceInRobux )
	end)
end)

Root.ReviveButton.MouseButton1Click:Connect(function()
	MarketplaceService:PromptProductPurchase( game.Players.LocalPlayer, DEV_PRODUCTS.Products.Revive )
	
	PurchaseGoing = true
end)

---------------------------------------
function onDeath()
	if not game.Players.LocalPlayer["UserData"]["InBossFight"].Value then return nil end

	script.Parent.Wrapper.Visible = true
	
	script.Parent.Wrapper.Position = UDim2.new(0.5, 0, -0.5, 0)
	TweenService:Create( script.Parent.Wrapper, InTweenInfo, {
		Position = UDim2.new(0.5, 0, 0.5, 0)
	} ):Play()
	
	Lighting.DeathBlur.Size = 0
	TweenService:Create( Lighting.DeathBlur, InTweenInfo, {
		Size = 24
	} ):Play()
end

game.Players.LocalPlayer.CharacterAdded:Connect(function( char )
	char:WaitForChild("Humanoid").Died:Connect(onDeath)
end)
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Died:Connect(onDeath)

function closeUi()
	script.Parent.Wrapper.Position = UDim2.new(0.5, 0, 0.5, 0)
	TweenService:Create( script.Parent.Wrapper, InTweenInfo, {
		Position = UDim2.new(0.5, 0, -0.5, 0)
	} ):Play()

	Lighting.DeathBlur.Size = 24
	TweenService:Create( Lighting.DeathBlur, InTweenInfo, {
		Size = 0
	} ):Play()
	
	task.wait( OutTweenInfo.Time )
	
	script.Parent.Wrapper.Visible = false
end
---------------------------------------
RunService.RenderStepped:Connect(function()
	local timeLeft = math.max( game.Players.LocalPlayer["UserData"]["CanReviveTill"].Value - DateTime.now().UnixTimestamp, 0 )
	
	Root.Timer.TextLabel.Text = string.format( Root.Timer.TextLabel:GetAttribute("OriginalText"), timeLeft )
	Root.TimeOver.Visible = timeLeft == 0 or PurchaseGoing
end)
---------------------------------------
Root.CloseButton.MouseButton1Click:Connect(function()
	if Root.Position ~= UDim2.new(0.5, 0, 0.5, 0) then return nil end
	if PurchaseGoing then return nil end
	
	ReplicatedStorage.Events.CtC.ToggleBlacker:Fire( true )
	
	task.wait(.75)
	
	ReplicatedStorage.Events.CtS.RespawnUser:FireServer()
	closeUi()
	
	task.wait(.75)
	
	ReplicatedStorage.Events.CtC.ToggleBlacker:Fire( false )
end)
MarketplaceService.PromptProductPurchaseFinished:Connect(function( player: Player, assetId: number, isPurchased: boolean )
	PurchaseGoing = isPurchased
	if not isPurchased then return nil end

	closeUi()
end)