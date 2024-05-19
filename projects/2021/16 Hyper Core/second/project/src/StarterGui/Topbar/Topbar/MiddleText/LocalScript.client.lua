
script.Parent.Changed:Connect(function()
	script.Parent.Shhadow.Text = script.Parent.Text
end)

game.ReplicatedStorage.RemoteEvents.SetLocalBroadcast.OnClientEvent:Connect(function(text, showtime)
	script.Parent.Text = text
	wait(showtime)
	script.Parent.Text = ""
end)

script.Parent.Text = "WELCOME TO HYPER TECHNOLOGIES!"
wait(5)
script.Parent.Text = "PLEASE READ THE MANUAL THE UNDERSTAND THE GAME."
wait(7)
script.Parent.Text = "ENJOY YOUR STAY!"
wait(5)
script.Parent.Text = ""

