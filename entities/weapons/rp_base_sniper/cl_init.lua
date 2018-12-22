include("shared.lua")

-- Variables for weapon scoping
local ScopeMultiplier = 0
local ScopeStart = nil
local ScopeReset = 0
local ScopeOffset = 0
local w = ScrW()
local h = ScrH()





-- Allows you to draw on the hud
function SWEP:DrawHUD()
	-- Check if we are to change our field of view due to scoping
	if ScopeMultiplier != 0 and ScopeMultiplier != 1 then
		-- Draw a black rect over everything and scale the alpha for a neat fadein effect
		surface.SetDrawColor(0, 0, 0, 255 * ScopeMultiplier)
		surface.DrawRect(0, 0, ScrW(), ScrH())
	elseif ScopeMultiplier == 1 then
		-- Set the draw color
		surface.SetDrawColor(10, 10, 10, 255)

		-- Draw the crosshair if we have one
		if not self.RedDot then
			surface.DrawLine(0, h / 2, w, h / 2)
			surface.DrawLine(w / 2, 0, w / 2, h)
			surface.SetTexture(surface.GetTextureID("scope/scope_normal"))
		-- Draw the red dot if we have one
		else
			surface.SetTexture(surface.GetTextureID("scope/scope_reddot"))
		end

		-- Draw the scope texture
		surface.DrawTexturedRect(w / 2 - h / 2, 0, h, h)

		-- Draw the outer black rectangles
		surface.DrawRect(0, 0, w / 4, h)
		surface.DrawRect(3 / 4 * w, 0, w / 4, h)
	end
end



-- Allows you to change the player's field of view
function SWEP:TranslateFOV(fov)
	-- Check if the weapon should be scoped
	if not self:GetLowered() and self:GetAnimationDelay() < CurTime() then
		-- Check if we have started scoping before
		if not ScopeStart then
			ScopeStart = CurTime()

			-- Store the current offset
			ScopeOffset = ScopeMultiplier

			-- Emit the scope in sound
			self:EmitSound(self.Sound_ZoomIn)
		end

		-- Add the multiplier to the current offset so that it goes from 0 to 1
		ScopeMultiplier = math.Clamp(ScopeOffset + ((CurTime() - ScopeStart) / self.ScopeTime), 0, 1)
	else
		-- Check if we have started scoping
		if ScopeStart then
			-- Reset the scope start time because we have started to reset scoping
			ScopeStart = nil

			-- Set the scope end time
			ScopeReset = CurTime()

			-- Store the current offset
			ScopeOffset = ScopeMultiplier

			-- Emit the scope out sound
			self:EmitSound(self.Sound_ZoomOut)
		end

		-- Subtract the multiplier from the current offset so that it goes from 1 to 0
		ScopeMultiplier = math.Clamp(ScopeOffset - ((CurTime() - ScopeReset) / self.ScopeTime), 0, 1)
	end

	-- Check if we are to change our field of view due to scoping
	if ScopeMultiplier != 0 then
		-- Add the angle
		fov = fov - self.ScopeZoom * ScopeMultiplier
	end

	-- Return the newly calculated position and angle
	return fov
end



-- Allows you to override where the tracer comes from
function SWEP:GetTracerOrigin()
	-- Check if the weapon should be scoped
	if not self:GetLowered() and self:GetAnimationDelay() < CurTime() then
		-- Relocate tracer to come from the middle when scoped
		return self:GetOwner():EyePos() + self:GetOwner():EyeAngles():Up() * -5
	end
end



-- Shake the player screen when scoped in
hook.Add("CreateMove", "ScopeShake", function(cmd)
	-- Get current weapon
	local wep = LocalPlayer():GetActiveWeapon()

	-- Check if the weapon should be scoped
	if IsValid(wep) and (wep.Base == "rp_base_sniper" or wep:GetClass() == "rp_base_sniper") and wep.GetLowered and not wep:GetLowered() and wep:GetAnimationDelay() < CurTime() then
		local ang = cmd:GetViewAngles()
		local ft = FrameTime()

		-- Check if the player is moving
		if not LocalPlayer():GetVelocity():IsZero() then
			ang.pitch = math.NormalizeAngle(ang.pitch + math.sin(CurTime() * 2) * ft * 2)
			ang.yaw = math.NormalizeAngle(ang.yaw + math.sin(CurTime() + 0.5) * ft * 2)
		-- Check if the player is crouching
		elseif LocalPlayer():Crouching() then
			ang.pitch = math.NormalizeAngle(ang.pitch + math.sin(CurTime() * 2) * ft * 0.2)
			ang.yaw = math.NormalizeAngle(ang.yaw + math.sin(CurTime() + 0.5) * ft * 0.2)
		-- The player is standing still
		else
			ang.pitch = math.NormalizeAngle(ang.pitch + math.sin(CurTime() * 2) * ft)
			ang.yaw = math.NormalizeAngle(ang.yaw + math.sin(CurTime() + 0.5) * ft)
		end

		-- Apply new angles
		cmd:SetViewAngles(ang)
	end
end)
