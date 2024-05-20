ReplicatedStorage = game:GetService("ReplicatedStorage")

local Module = require( ReplicatedStorage.Modules.Items.SupplyChest )

Module:Create( script.Parent, script.Parent.Configuration )