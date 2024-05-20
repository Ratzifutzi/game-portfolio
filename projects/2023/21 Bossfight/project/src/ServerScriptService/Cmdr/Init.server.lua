local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Root = script.Parent
local Cmdr = require(Root.Core)

Cmdr:RegisterCommandsIn( Root.Commands )
Cmdr:RegisterHooksIn( Root.Hooks )
Cmdr:RegisterTypesIn( Root.Types )