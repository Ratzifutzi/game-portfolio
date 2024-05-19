Configuration = require(script.Parent.Parent.Configuration)

Events = game.ReplicatedStorage.Events

local module = {}

function module.SpawnPlayer(player:Player, spawnId:IntValue, obbyId:IntValue)
	local spawnLocation:SpawnLocation = workspace.Checkpoints:FindFirstChild(tostring(spawnId))
	local character = player.Character

	character:MoveTo(spawnLocation.Position)
end

function module.InitCheckpoints()
	for k, _checkpoint:SpawnLocation in pairs(workspace.Checkpoints:GetChildren()) do
		local checkpointId = tonumber(_checkpoint.Name)

		_checkpoint.Enabled = false
		_checkpoint.Touched:Connect(function(toucher)
			if not toucher.Parent:FindFirstChild("Humanoid") then return end

			local _character:Instance? = toucher.Parent
			local _player:Player = game.Players:FindFirstChild(_character.Name)

			-- Checks
			if _character.Humanoid.Health == 0 then return end
			if tonumber(_checkpoint.Name) <= _player["Data"]["Stage"].Value then return end

			-- Finish Up

			_player["Data"]["Stage"].Value = checkpointId
			_player["Data"]["DeathsThisStage"].Value = 0

			-- Send Event to client
			Events.fromServer.NextCheckpointReached:FireClient(_player, _checkpoint)

			-- Manage win if win

		end)
	end
end

return module