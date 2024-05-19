function onTouched(hit)
	if hit.Parent:findFirstChild("Humanoid") then
		hit.Parent.Humanoid:TakeDamage(hit.Parent.Humanoid.MaxHealth)
		local fire = Instance.new("Smoke")
		fire.Parent = hit
		
	end
end

script.Parent.Touched:connect(onTouched)
