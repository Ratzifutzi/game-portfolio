local config = {
	["SystemMessages"] = {
		["Messages"] = {
			["Example"] = {
				["Color"] = Color3.fromRGB(255, 0, 255),
				["Message"] = "This is a pink message."
			}	
		},
		["CycleDuration"] = 6 * 60 -- in seconds
	},
	["Obby"] = {
		["CheckpointAdvanceCooldown"] = 2, -- How many seconds a player must wait before touching the next checkpoint. Touching a checkpoint only works after N seconds of the cooldown have passed. 0 = Disabled
		--["MaximalSkipableStages"] = 5, -- How many stages a player can proceed without touching a Checkpoint. -1 = Disabled
		["ShowSkipAdAfter"] = 5, -- How often a player needs to fail a stage to see the "Skip Stage" Ad.
		["FirstSpawns"] = {
			["0"] = "0" -- KEY = Obby ID - VALUE = Spawn ID
		}
	},
	["FreeGamepassesInStudio"] = true,
	["Players"] = {
		["DefaultRespawnTime"] = 1.5 -- How many seconds the player stays as radgoll before respawning
	}
}

return config
