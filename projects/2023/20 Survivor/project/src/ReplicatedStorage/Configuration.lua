local config = {}

config.Lighting = {
	["Night"] = 19.1,

	["Evening"] = 17.8,
	["Morning"] = 6.5
}

config.Timers = {
	["DayDuration"] = 30,
	["NightDuration"] = 30
}

config.FireBowl = {
	["MaximalBurnTime"] = 10 * 60,
	["MaximalHealth"] = 100
}

config.BuildSystem = {
	["MinDistanceFromCenter"] = 15,
	["RotationSpeed"] = 75,
	["SnapRotateSteps"] = 8,
	["UseGridPlacement"] = true,
}

config.Movement = {
	["JumpCooldown"] = 0.75
}

config.Keybinds = {
	["Build"] = {
		["RotateRight"] = Enum.KeyCode.E,
		["RotateLeft"] = Enum.KeyCode.Q
	}
}

config.Map = {
	["TreeSpawnChance"] = 100
}

config.Defenses = {
	["MineMinContact"] = 0.25
}

return config