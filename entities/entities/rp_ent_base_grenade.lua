AddCSLuaFile()

-- Base info
ENT.Base			= "base_anim"
ENT.PrintName		= "Grenade Entity Base"
ENT.Author			= "Arkten"

-- Misc info
ENT.Model			= "models/weapons/w_eq_fraggrenade.mdl"
ENT.ExplodeTime		= 3
ENT.ExplodeSound	= Sound("")
ENT.BounceSound		= Sound("HEGrenade.Bounce")





-- Called when the entity explodes
function ENT:Explode()
	-- Play the explode sound
	self:EmitSound(self.ExplodeSound)

	-- Remove the entity
	if SERVER then
		-- Small delay so that the CLIENT can still call its stuff
		timer.Simple(0.1, function()
			self:Remove()
		end)
	end
end


-- Called every frame
function ENT:Think()
	-- Run Initialize clientside as well
	if not self.Explode then
		self:Initialize()
	end
end


-- Called when the entity collides with anything
function ENT:PhysicsCollide(data, phys)
	-- Emit bounce sound
	if data.Speed > 50 then
		self:EmitSound(self.BounceSound)
	end

	-- Bounce back
	local impulse = -data.Speed * data.HitNormal * 0.2
	phys:ApplyForceCenter(impulse)
end


-- Called when the entity is created
function ENT:Initialize()
	-- Set the entity model
	self:SetModel(self.Model)

	-- Draw no shadow
	self:DrawShadow(false)

	-- Set physics
	if SERVER then
		self:SetSolid(SOLID_VPHYSICS)
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetCollisionGroup(COLLISION_GROUP_WEAPON)

		-- Wake physics
		local phys = self:GetPhysicsObject()
		if phys:IsValid() then
			phys:Wake()
		end
	end

	-- Explode after the timer has passed
	timer.Simple(self.ExplodeTime, function()
		if self and self.Explode then
			self:Explode()
		end
	end)
end
