DSS = game:GetService("DataStoreService")
GraphicsSettingsStore = DSS:GetDataStore("SettingsData", "Graphics")

game.ReplicatedStorage.ChangeGraphics.OnServerEvent:Connect(function(sender, level)
	wait(1.5)
	if level == 0 then
		workspace.Fog1.Transparency = 1
		workspace.Fog2.Transparency = 1
		
		workspace.trees1.TreeMeshBottom.Transparency = 1
		workspace.trees2.TreeMeshBottom.Transparency = 1
		workspace.trees3.TreeMeshBottom.Transparency = 1
		workspace.trees1.TreeMeshTop.Transparency = 1
		workspace.trees2.TreeMeshTop.Transparency = 1
		workspace.trees3.TreeMeshTop.Transparency = 1
	elseif level == 1 then
		workspace.Fog1.Transparency = 1
		workspace.Fog2.Transparency = 1
		
		workspace.trees1.TreeMeshBottom.Transparency = 0
		workspace.trees2.TreeMeshBottom.Transparency = 0
		workspace.trees3.TreeMeshBottom.Transparency = 0
		workspace.trees1.TreeMeshTop.Transparency = .1
		workspace.trees2.TreeMeshTop.Transparency = .1
		workspace.trees3.TreeMeshTop.Transparency = .1
	elseif level == 2 then
		workspace.Fog1.Transparency = .97
		workspace.Fog2.Transparency = .97
		
		workspace.trees1.TreeMeshBottom.Transparency = 0
		workspace.trees2.TreeMeshBottom.Transparency = 0
		workspace.trees3.TreeMeshBottom.Transparency = 0
		workspace.trees1.TreeMeshTop.Transparency = .1
		workspace.trees2.TreeMeshTop.Transparency = .1
		workspace.trees3.TreeMeshTop.Transparency = .1
	end
	
	local success, err = pcall(function()
		GraphicsSettingsStore:SetAsync(sender.Name, level)
	end)
	
	if success then
		print("Updated!")
		print()
	else
		warn(err)
	end
end)

game.Players.PlayerAdded:Connect(function(plr)
	local success, graphics = pcall(function()
		return GraphicsSettingsStore:GetAsync(plr.Name)
	end)
	
	
	if not success then
		warn("error loading data")
	end
	
	
	if graphics == nil then
		graphics = 2
	end
	
	repeat
		wait()
	until plr:WaitForChild("PlayerGui"):WaitForChild("ScreenGui")
	plr.PlayerGui.ScreenGui.SettingsUI.Graphics.Selected.Value = graphics
	
	
	if graphics == 0 then
		workspace.Fog1.Transparency = 1
		workspace.Fog2.Transparency = 1

		workspace.trees1.TreeMeshBottom.Transparency = 1
		workspace.trees2.TreeMeshBottom.Transparency = 1
		workspace.trees3.TreeMeshBottom.Transparency = 1
		workspace.trees1.TreeMeshTop.Transparency = 1
		workspace.trees2.TreeMeshTop.Transparency = 1
		workspace.trees3.TreeMeshTop.Transparency = 1
	elseif graphics == 1 then
		workspace.Fog1.Transparency = 1
		workspace.Fog2.Transparency = 1

		workspace.trees1.TreeMeshBottom.Transparency = 0
		workspace.trees2.TreeMeshBottom.Transparency = 0
		workspace.trees3.TreeMeshBottom.Transparency = 0
		workspace.trees1.TreeMeshTop.Transparency = .1
		workspace.trees2.TreeMeshTop.Transparency = .1
		workspace.trees3.TreeMeshTop.Transparency = .1
	elseif graphics == 2 then
		workspace.Fog1.Transparency = .97
		workspace.Fog2.Transparency = .97

		workspace.trees1.TreeMeshBottom.Transparency = 0
		workspace.trees2.TreeMeshBottom.Transparency = 0
		workspace.trees3.TreeMeshBottom.Transparency = 0
		workspace.trees1.TreeMeshTop.Transparency = .1
		workspace.trees2.TreeMeshTop.Transparency = .1
		workspace.trees3.TreeMeshTop.Transparency = .1
	end
end)