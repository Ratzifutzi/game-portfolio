-- Used to get toughing parts for CanCollide off parts

return function ( part:BasePart )
	if not part:IsA("BasePart") then return {} end
	
	local connection = part.Touched:Connect(function() end)
	local results = part:GetTouchingParts()
	
	connection:Disconnect()
	
	return results
end