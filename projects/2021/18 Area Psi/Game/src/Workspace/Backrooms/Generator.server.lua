OldSegment = script.Parent.Generator.MainSegment
ClonedSegment = nil
OldSegmentB = script.Parent.Generator.MainSegment
ClonedSegmentB = nil
function Manage()
	OldSegment.GenerateTriggerA.Touched:Connect(function()
		print("2")
		if OldSegment.GenerateTriggerA.GenratedCopy.Value == false then
			OldSegment.GenerateTriggerA.GenratedCopy.Value = true
			ClonedSegment = OldSegment:Clone()
			ClonedSegment.GenerateTriggerB.GenratedCopy.Value = true
			ClonedSegment.Parent = script.Parent.Generator
			ClonedSegment.Name = "Segment"
			ClonedSegment.ConnectorB.CFrame = OldSegment.ConnectorA.CFrame
			OldSegment.GenerateTriggerA:Destroy()
			OldSegment = ClonedSegment
			ClonedSegment.GenerateTriggerA.GenratedCopy.Value = false
			Manage()
		end
	end)
end

function ManageBack()
	OldSegmentB.GenerateTriggerB.Touched:Connect(function()
		if OldSegmentB.GenerateTriggerB.GenratedCopy.Value == false then
			OldSegmentB.GenerateTriggerB.GenratedCopy.Value = true
			ClonedSegmentB = OldSegment:Clone()
			ClonedSegmentB.GenerateTriggerA.GenratedCopy.Value = true
			ClonedSegmentB.Parent = script.Parent.Generator
			ClonedSegmentB.Name = "Segment"
			ClonedSegmentB.ConnectorA.CFrame = OldSegment.ConnectorB.CFrame
			OldSegmentB.GenerateTriggerB:Destroy()
			OldSegmentB = ClonedSegment
			ClonedSegment.GenerateTriggerB.GenratedCopy.Value = false
			ManageBack()
		end
	end)
end

Manage()
ManageBack()