wait(20)
print("Spawn")

while true do
	require( script.Parent ).Spawn( game.ReplicatedStorage.BossPatterns:GetChildren()[ math.random(1, #game.ReplicatedStorage.BossPatterns:GetChildren()) ] )
	--require( script.Parent ).Spawn( game.ReplicatedStorage.BossPatterns.RingsA )
end