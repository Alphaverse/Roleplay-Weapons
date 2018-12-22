AddCSLuaFile()

-- Base info
ENT.Base			= "rp_ent_base_grenade"
ENT.PrintName		= "Smoke"
ENT.Author			= "Arkten"

-- Misc info
ENT.Model			= "models/weapons/w_eq_smokegrenade.mdl"
ENT.ExplodeTime		= 3
ENT.ExplodeSound	= Sound("BaseSmokeEffect.Sound")
ENT.BounceSound		= Sound("SmokeGrenade.Bounce")

local SMOKE_EFFECT	= "particle/particle_smokegrenade"





-- Called when the entity explodes
function ENT:Explode()
	-- Emit the smoke sound
	self:EmitSound(self.ExplodeSound)

	-- Client only
	if CLIENT then
		-- Create ParticleEmitter
		local emitter = ParticleEmitter(self:GetPos())

		-- Dont create a smoke underwater
		if not IsValid(self) or self:WaterLevel() > 2 then return end

		-- Create a few small particles
		for i = 0, 100 do
			-- Create the actual smoke effect
			local smoke = emitter:Add(SMOKE_EFFECT, self:GetPos() + Vector(0, 0, 100))
			smoke:SetColor(120, 120, 120)
			smoke:SetAirResistance(500)

			-- Set random values to make it look realistic
			smoke:SetVelocity(VectorRand() * 300)
			smoke:SetGravity(Vector(math.Rand(-100, 100), math.Rand(-100, 100), math.Rand(0, 25)))
			smoke:SetRoll(math.Rand(-180, 180))
			smoke:SetRollDelta(math.Rand(-0.2,0.2))

			-- Dissipate after a certain amount of time
			smoke:SetDieTime(45)
			smoke:SetStartAlpha(255)
			smoke:SetEndAlpha(0)
			smoke:SetStartSize(150)
			smoke:SetEndSize(150)
		end

		-- Start emitting
		emitter:Finish()
	end

	if SERVER then
		-- Small delay so that the CLIENT can still call its stuff
		timer.Simple(0.1, function()
			self:Remove()
		end)
	end
end
