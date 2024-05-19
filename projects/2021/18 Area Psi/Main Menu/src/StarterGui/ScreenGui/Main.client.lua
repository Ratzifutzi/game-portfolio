TweenService = game:GetService("TweenService")

script.Parent.Play.TextTransparency = 1
script.Parent.Settings.TextTransparency = 1
script.Parent.Credits.TextTransparency = 1
script.Parent.Admin.TextTransparency = 1
script.Parent.Enabled = true
script.Parent.SettingsUI.Visible = false
script.Parent.LobbyCreation.Visible = false

script.Parent.loading.Visible = true

local UserInputService = game:GetService("UserInputService")

-- Shift keys
local key1 = Enum.KeyCode.Space

-- Return whether left or right shift keys are down
local function IsShiftKeyDown()
	return UserInputService:IsKeyDown(key1)
end

local function Input(input, gameProcessedEvent)
	if IsShiftKeyDown() then
		script.Parent.Play.TextTransparency = 0
		script.Parent.Settings.TextTransparency = 0
		script.Parent.Credits.TextTransparency = 0
		script.Parent.Admin.TextTransparency = 0
		TweenService:Create(script.Parent.Parent.TopOfEverything.Skip,TweenInfo.new(.5, Enum.EasingStyle.Sine), {TextTransparency = 1}):Play()
		script.Parent.loading.Visible = false
		repeat script.Parent.Fullscreen.BackgroundTransparency = 1 until script.Parent.Fullscreen.BackgroundTransparency == 1
	end
end

UserInputService.InputBegan:Connect(Input)
-- Handle user input began differently depending on whether a shift key is pressed

script.Parent.Fullscreen.BackgroundTransparency = 0
TweenService:Create(script.Parent.Fullscreen, TweenInfo.new(10), {BackgroundTransparency = 1}):Play()

wait(1)

TweenService:Create(script.Parent.Parent.TopOfEverything.Skip,TweenInfo.new(.5, Enum.EasingStyle.Sine), {TextTransparency = 0}):Play()

wait(10)

script.Parent.loading.Visible = false
wait(.7)



CheckDS = function()
	if workspace.DatastoresAvaible.Value == false then
		script.Parent.Parent.TopOfEverything.DatastoreUnavaible.StartAnimation:Fire()
	else
		script.Parent.Parent.TopOfEverything.DatastoreUnavaible.EndAnimation:Fire()
	end
end

workspace.DatastoresAvaible.Changed:Connect(function()
	CheckDS()
end)

CheckDS()

TweenService:Create(script.Parent.Admin, TweenInfo.new(2.5), {TextTransparency = 0}):Play()
TweenService:Create(script.Parent.Play, TweenInfo.new(2.5), {TextTransparency = 0}):Play()
wait(2)
TweenService:Create(script.Parent.Parent.TopOfEverything.Skip,TweenInfo.new(.5, Enum.EasingStyle.Sine), {TextTransparency = 1}):Play()
TweenService:Create(script.Parent.Credits, TweenInfo.new(2.5), {TextTransparency = 0}):Play()
wait(2)
TweenService:Create(script.Parent.Settings, TweenInfo.new(2.5), {TextTransparency = 0}):Play()

