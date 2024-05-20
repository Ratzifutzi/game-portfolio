--[[
	Scripted by LumberUniverse
]]

local UserInputService = game:GetService('UserInputService')

local Stroke = {}

function Stroke:Init(Menu, UI, Resources)
	self.UI = UI
	self.Buttons = self.UI.Buttons
	self.Thickness = self.Buttons.StrokeThickness:FindFirstChildOfClass('TextBox')
	self.Transparency = self.Buttons.StrokeTransparency:FindFirstChildOfClass('TextBox')
	self.Menu = Menu
	self.TextFunctions = require(Resources.Modules.TextFunctions)
	
	self.TextFunctions:MakeNumberOnly(self.Thickness, 0, 100)
	self.TextFunctions:MakeNumberOnly(self.Transparency, 0, 1)
	
	self.Buttons.Colour.MouseButton1Click:Connect(function()
		local Position = self.Menu:GetRelativeMousePosition()
		local Size = self.UIs.ColourMenu.UI.AbsoluteSize
		local MenuSize = self.UIs.Main.UI.AbsoluteSize

		self.UIs.ColourMenu.UI.Visible = true
		self.UIs.ColourMenu.UI.Position = UDim2.new(0, Position.X, 0, 95)

		self.UIs.ColourMenu.Module:Open('Stroke')

		if Position.X + Size.X > MenuSize.X or Position.Y + Size.Y > MenuSize.Y then
			self.UIs.ColourMenu.UI.AnchorPoint = Vector2.new(1, 0)
		else
			self.UIs.ColourMenu.UI.AnchorPoint = Vector2.new(0, 0)
		end
	end)
	
	self.UI.Apply.MouseButton1Click:Connect(function()
		local Colour = self.Buttons.Colour.TextLabel.UIStroke.Color
		local Thickness = self.Thickness.Text
		local Transparency = self.Transparency.Text
		
		local ColourTag = string.format('color="rgb(%i,%i,%i)"', Colour.R * 255, Colour.G * 255, Colour.B * 255)
		local ThicknessTag = string.format('thickness="%s"', Thickness)
		local TransparencyTag = string.format('transparency="%s"', Transparency)
		local Extras = string.format('%s %s %s', ColourTag, ThicknessTag, TransparencyTag)
		
		--self.TextFunctions:ApplyMarkup(self.UIs.Main.Module.Input, 'stroke', Extras)
		self.TextFunctions:ApplyStroke(self.UIs.Main.Module.Input, Extras)
		self.UI.Visible = false
	end)
end

function Stroke:SetUIs(UIs)
	self.UIs = UIs
	
	self.CloseButton = self.UIs.ColourMenu.Module.CloseButton

	self.UI:GetPropertyChangedSignal('Visible'):Connect(function()
		self.CloseButton.Visible = self.UI.Visible
	end)
	
	self.CloseButton.MouseButton1Click:Connect(function()
		if not self.UI.Visible then return end
		
		self.UI.Visible = false
	end)
end

return Stroke