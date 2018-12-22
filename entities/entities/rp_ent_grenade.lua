AddCSLuaFile()

-- Base info
ENT.Base			= "rp_ent_base_grenade"
ENT.PrintName		= "Grenade"
ENT.Author			= "Arkten"

-- Misc info
ENT.Model			= "models/weapons/w_eq_fraggrenade.mdl"
ENT.ExplodeTime		= 3
ENT.ExplodeSound	= Sound("")
ENT.BounceSound		= Sound("HEGrenade.Bounce")





-- Called when the entity explodes
function ENT:Explode()
	if SERVER then
		-- Create explosion effect
		local effectdata = EffectData()
		effectdata:SetOrigin(self:GetPos())
		util.Effect("HelicopterMegaBomb", effectdata)

		-- Create actual explosion
		local explo = ents.Create("env_explosion")
		explo:SetOwner(self:GetOwner())
		explo:SetPos(self:GetPos())
		explo:SetKeyValue("iMagnitude", "200")
		explo:Spawn()
		explo:Activate()
		explo:Fire("Explode", "", 0)

		-- Create shake
		local shake = ents.Create("env_shake")
		shake:SetOwner(self:GetOwner())
		shake:SetPos(self:GetPos())
		shake:SetKeyValue("amplitude", "2000")
		shake:SetKeyValue("radius", "900")
		shake:SetKeyValue("duration", "2.5")
		shake:SetKeyValue("frequency", "255")
		shake:SetKeyValue("spawnflags", "4")
		shake:Spawn()
		shake:Activate()
		shake:Fire("StartShake", "", 0)

		-- Remove the entity
		self:Remove()
	end
end
