include("shared.lua")

-- Weapon icon info
SWEP.WepSelectIcon = surface.GetTextureID("weapons/swep")

-- Variables for weapon lowering
local LowerMultiplier = 0
local LowerStart = nil
local LowerReset = 0
local LowerOffset = 0





-- Allows you to reposition the view model
function SWEP:GetViewModelPosition(pos, ang)
	-- Check if the weapon should be lowered
	if self:GetLowered() and self:GetAnimationDelay() < CurTime() then
		-- Check if we have started lowering before
		if not LowerStart then
			LowerStart = CurTime()

			-- Store the current offset
			LowerOffset = LowerMultiplier
		end

		-- Add the multiplier to the current offset so that it goes from 0 to 1
		LowerMultiplier = math.Clamp(LowerOffset + ((CurTime() - LowerStart) / self.LowerTime), 0, 1)
	else
		-- Check if we have started lowering
		if LowerStart then
			-- Reset the lower start time because we have started to reset lowering
			LowerStart = nil

			-- Set the lower end time
			LowerReset = CurTime()

			-- Store the current offset
			LowerOffset = LowerMultiplier
		end

		-- Subtract the multiplier from the current offset so that it goes from 1 to 0
		LowerMultiplier = math.Clamp(LowerOffset - ((CurTime() - LowerReset) / self.LowerTime), 0, 1)
	end

	-- Check if we are to move our weapon due to lowering
	if LowerMultiplier != 0 then
		-- Add the angle
		ang = ang + self.LowerAngle * LowerMultiplier

		-- Relocate the viewmodel
		pos = pos + self.LowerPosition.x * ang:Forward() * LowerMultiplier
		pos = pos + self.LowerPosition.y * ang:Right() * LowerMultiplier
		pos = pos + self.LowerPosition.z * ang:Up() * LowerMultiplier
	end

	-- Return the newly calculated position and angle
	return pos, ang
end
