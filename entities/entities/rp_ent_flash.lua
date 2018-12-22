AddCSLuaFile()

-- Base info
ENT.Base			= "rp_ent_base_grenade"
ENT.PrintName		= "Flash"
ENT.Author			= "Arkten"

-- Misc info
ENT.Model			= "models/weapons/w_eq_flashbang.mdl"
ENT.ExplodeTime		= 3
ENT.ExplodeSound	= Sound("Flashbang.Explode")
ENT.BounceSound		= Sound("Flashbang.Bounce")

local FLASH_DURATION	= 3
local STUN_DURATION		= 7





-- Called when the entity explodes
function ENT:Explode()
	-- Emit explode sound
	self:EmitSound(self.ExplodeSound)

	if CLIENT then
		-- Stop drawing the model
		self:SetNoDraw(true)

		-- Create dynamic light
		local light = DynamicLight(self:EntIndex())

		-- Add light values
		if light then
			light.Pos = self:GetPos()
			light.r = 255
			light.g = 255
			light.b = 255
			light.Brightness = 1
			light.Size = 1000
			light.Decay = 2000
			light.DieTime = CurTime() + 0.5
		end

		-- Perform a trace from our player to entity
		local tr = util.TraceLine({
			start = LocalPlayer():GetShootPos(),
			endpos = self:GetPos(),
			filter = LocalPlayer()
		})

		-- Check if we did not hit the world (no obstruction)
		if not tr.HitWorld then
			-- Get the distance
			local distsqr = LocalPlayer():GetShootPos():DistToSqr(self:GetPos())

			-- Cap the distance
			if distsqr < 1000000 then
				-- Set end times
				LocalPlayer():SetVar("FLASH_END", CurTime() + math.Clamp(1000000 / distsqr, 0, FLASH_DURATION))
				LocalPlayer():SetVar("STUN_END", CurTime() + math.Clamp(1000000 / distsqr, 0, STUN_DURATION))
			end
		end
	end

	-- Remove entity
	if SERVER then
		-- Small delay so that the CLIENT can still call its stuff
		timer.Simple(0.1, function()
			self:Remove()
		end)
	end
end


-- White screen effect
hook.Add("HUDPaint", "FlashEffect", function()
	-- Check if we are flashed
	if LocalPlayer():GetVar("FLASH_END", 0) > CurTime() then
		-- Calculate alpha
		local alpha = Lerp((LocalPlayer():GetVar("FLASH_END", 0) - CurTime()) / FLASH_DURATION, 0, 255)

		-- Draw white screen
		surface.SetDrawColor(255, 255, 255, alpha)
		surface.DrawRect(0, 0, ScrW(), ScrH())
	end
end)


-- Frozen frame effect
hook.Add("RenderScreenspaceEffects", "StunEffect", function()
	-- Check if we are flashed
	if LocalPlayer():GetVar("STUN_END", 0) > CurTime() then
		-- Calculate alpha
		local alpha = Lerp((LocalPlayer():GetVar("STUN_END", 0) - CurTime()) / STUN_DURATION, 0, 255)

		-- Draw frozen screen
		DrawMotionBlur(0, FLASH_DURATION * alpha / 255, 0)
	end
end)
