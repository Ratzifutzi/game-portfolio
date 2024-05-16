script.Parent.Transparency=1
function onTouched(hit)
	human = hit.Parent:FindFirstChild("Humanoid")
	
	script.Parent.Parent.Light.PointLight.Enabled=false
	script.Parent.Parent.Light.Color=Color3.new(0,0,0)
	script.Parent.Parent.electricity.ParticleEmitter.Enabled=true
	wait(.4)
	script.Parent.Parent.electricity.ParticleEmitter.Enabled=false
	script.Parent:Destroy()
	
end
script.Parent.Touched:connect(onTouched)