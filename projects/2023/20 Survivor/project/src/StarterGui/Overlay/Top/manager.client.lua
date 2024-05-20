RunService = game:GetService("RunService")
ReplicatedStorage = game:GetService("ReplicatedStorage")

TimeFormatter = require(ReplicatedStorage.Modules.Formatting.Time)

UiRoot = script.Parent
CountdownText = UiRoot.Countdown

RunService.RenderStepped:Connect(function( dt : number )
	local currentTime = math.max( workspace.Values.NextEventAt.Value, DateTime.now().UnixTimestamp ) - DateTime.now().UnixTimestamp
	
	CountdownText.Text = TimeFormatter.FormatIntToTime( currentTime )["full"]
end)