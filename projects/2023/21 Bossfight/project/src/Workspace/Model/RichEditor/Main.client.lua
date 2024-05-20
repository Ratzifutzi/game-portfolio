--[[
	Scripted by LumberUniverse
]]

--[[
	Constants
	@ Any constants are located below
]]

local Resources = script.Parent.Resources
local Modules = Resources.Modules
local Toolbar = plugin:CreateToolbar('RichEditor')
local Button = Toolbar:CreateButton('Editor', 'Open the rich text editor', 'rbxassetid://7762038856')
Button.ClickableWhenViewportHidden = true
local MenuInfo = DockWidgetPluginGuiInfo.new(
	Enum.InitialDockState.Float,
	false,
	false,
	600,
	350,
	600,
	350
)
local Menu = plugin:CreateDockWidgetPluginGui('RichEditor', MenuInfo)
Menu.Title = 'Editor'

--[[
	Variables
	@ Any variables are located below
]]

local Menus = {}

--[[
	Runtime
	@ Anything that is run on runtime is located below
]]

task.spawn(function()
	for i, menu in pairs(Resources.Menus:GetChildren())do
		local clone = menu:Clone()
		clone.Parent = Menu

		Menus[clone.Name] = {
			UI = clone,
			Module = Modules:FindFirstChild(clone.Name) and require(Modules:FindFirstChild(clone.Name))
		}
		
		if Menus[clone.Name].Module then
			Menus[clone.Name].Module:Init(Menu, clone, Resources)
		end
	end
	
	for i, menu in pairs(Menus)do
		if not (menu.Module and menu.Module.SetUIs) then continue end

		menu.Module:SetUIs(Menus)
	end
end)

--[[
	Events
	@ Any events are located below
]]

Button.Click:Connect(function()
	Menu.Enabled = not Menu.Enabled
end)