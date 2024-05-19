while true do
	wait()
	local playerCount = #game.Players:GetPlayers()
	script.Parent.Text= playerCount.." workers(players)"
	script.Parent.TextColor3=Color3.new(0,1,0)
end