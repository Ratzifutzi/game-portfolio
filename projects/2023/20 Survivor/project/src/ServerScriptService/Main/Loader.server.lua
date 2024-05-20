require(script.Parent).init( {} )

-- Debug ---
workspace.Values.NextEventAt.Value = DateTime.now().UnixTimestamp + 10

repeat wait() until workspace.Values.NextEventAt.Value < DateTime.now().UnixTimestamp

require( script.Parent.Functions.Game ).StartGame()
-- Debug ---