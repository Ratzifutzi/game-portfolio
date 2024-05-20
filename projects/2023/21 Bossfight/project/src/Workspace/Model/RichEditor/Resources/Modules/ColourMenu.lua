--[[
	Scripted by LumberUniverse
]]

local UserInputService = game:GetService('UserInputService')

local ColourMenu = {}

function ColourMenu:Init(Menu, UI, Resources)
	self.UI = UI
	self.Menu = Menu
	self.Colour = Color3.fromRGB(255, 0, 0)
	self.Value = 1
	self.ColourUI = self.UI.Colour
	self.ValueUI = self.UI.Value
	self.ColourDown = false
	self.ValueDown = false
	self.TextFunctions = require(Resources.Modules.TextFunctions)
	
	self.CloseButton = Instance.new('TextButton')
	self.CloseButton.Parent = Menu
	self.CloseButton.Size = UDim2.new(1, 0, 1, 0)
	self.CloseButton.BackgroundTransparency = 1
	self.CloseButton.TextTransparency = 1
	self.CloseButton.ZIndex = 2
	self.CloseButton.Visible = false
	
	self.UI:GetPropertyChangedSignal('Visible'):Connect(function()
		self.CloseButton.Visible = self.UI.Visible
	end)
	
	self.ColourUI.MouseButton1Down:Connect(function()
		self.ColourDown = true
	end)

	self.ColourUI.MouseButton1Up:Connect(function()
		self.ColourDown = false
		self.ValueDown = false
	end)

	self.ValueUI.MouseButton1Down:Connect(function()
		self.ValueDown = true
	end)

	self.ValueUI.MouseButton1Up:Connect(function()
		self.ColourDown = false
		self.ValueDown = false
	end)
	
	self.CloseButton.MouseButton1Up:Connect(function()
		self.ColourDown = false
		self.ValueDown = false
	end)
	
	self.CloseButton.MouseMoved:Connect(function()
		if not self.UI.Visible then return end

		local Position = self.Menu:GetRelativeMousePosition()
		
		if self.ColourDown then
			local UIPosition = self.ColourUI.AbsolutePosition
			local UISize = self.ColourUI.AbsoluteSize
			local DraggerPosition = Vector2.new(math.clamp(Position.X - UIPosition.X, 0, UISize.X), math.clamp(Position.Y - UIPosition.Y, 0, UISize.Y))
			
			self.ColourUI.Dragger.Position = UDim2.new(0, DraggerPosition.X, 0, DraggerPosition.Y)
			self.Colour = Color3.fromHSV(1 - DraggerPosition.X/UISize.X, 1 - DraggerPosition.Y/UISize.Y, 1)
			self.ValueUI.BackgroundColor3 = self.Colour
		end
		
		if self.ValueDown then
			local UIPosition = self.ValueUI.AbsolutePosition
			local UISize = self.ValueUI.AbsoluteSize
			local DraggerPosition = Vector2.new(0, math.clamp(Position.Y - UIPosition.Y, 0, UISize.Y))
			self.ValueUI.Dragger.Position = UDim2.new(0, 0, DraggerPosition.Y/UISize.Y, 0)
		end
		
		local h, s, v = self.Colour:ToHSV()
		self.ProcessedColour = Color3.fromHSV(h, s, 1 - self.ValueUI.Dragger.Position.Y.Scale)
		if self.OpenedMenu == 'Stroke' then
			self.UIs.Stroke.UI.Buttons.Colour.TextLabel.UIStroke.Color = self.ProcessedColour
		else
			self.UIs.Main.UI.Buttons.Colour.TextLabel.TextColor3 = self.ProcessedColour
		end
	end)

	self.CloseButton.MouseButton1Click:Connect(function()
		if not self.UI.Visible then return end

		local Position = self.Menu:GetRelativeMousePosition()
		local UIPosition = self.UI.AbsolutePosition
		local UISize = self.UI.AbsoluteSize
		if not (Position.X <= UIPosition.X + UISize.X and Position.X >= UIPosition.X and Position.Y <= UIPosition.Y + UISize.Y and Position.Y >= UIPosition.Y) then
			self.UI.Visible = false
		end
	end)
	
	self.UI.Apply.MouseButton1Click:Connect(function()
		local Colour = self.UIs.Main.UI.Buttons.Colour.TextLabel.TextColor3
		if self.OpenedMenu ~= 'Stroke' then
			self.TextFunctions:ApplyColour(self.UIs.Main.Module.Input, string.format('%i,%i,%i', Colour.R * 255, Colour.G * 255, Colour.B * 255))
		end
		self.UI.Visible = false
		self.Clicked = true
	end)
end

function ColourMenu:Open(Menu)
	self.OpenedMenu = Menu
end

function ColourMenu:SetUIs(UIs)
	self.UIs = UIs
end

return ColourMenu