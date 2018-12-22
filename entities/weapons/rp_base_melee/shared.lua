AddCSLuaFile()

-- Base info
SWEP.Base						= "rp_base"

-- Spawnmenu info
SWEP.Category					= "Roleplay Weapons"
SWEP.Spawnable					= true
SWEP.AdminOnly					= true
SWEP.DisableDuplicator			= true

-- Weapon selection menu info
SWEP.AutoSwitchFrom				= false
SWEP.AutoSwitchTo				= false

-- Print info
SWEP.PrintName					= "Roleplay Weapons Melee Base"
SWEP.Author						= "Arkten"

-- Viewport info
SWEP.ViewModel					= "models/weapons/cstrike/c_knife_t.mdl"
SWEP.WorldModel					= "models/weapons/w_knife_t.mdl"
SWEP.HoldType					= "melee"
SWEP.CSMuzzleFlashes			= false
SWEP.CSMuzzleX					= false

-- Primary info
SWEP.Primary.Ammo				= "none"
SWEP.Primary.ClipSize			= -1
SWEP.Primary.DefaultClip		= -1
SWEP.Primary.Automatic			= false
SWEP.Primary.RPM				= -1
SWEP.Primary.NumShots			= -1
SWEP.Primary.Cone				= -1
SWEP.Primary.SpreadIncrease		= -1

-- Sound info
SWEP.Sound_Deploy				= Sound("Weapon_Knife.Deploy")
SWEP.Sound_Hit					= Sound("Weapon_Knife.Hit")
SWEP.Sound_Wall					= Sound("Weapon_Knife.HitWall")
SWEP.Sound_Miss					= Sound("Weapon_Knife.Slash")

-- Misc info
SWEP.IsHeavyWeapon				= false
SWEP.HasSuppressor				= false
SWEP.Damage						= 40
SWEP.DamageType					= DMG_SLASH





-- Get your knife out
function SWEP:Deploy()
	-- Play the draw animation
	self:SendWeaponAnim(ACT_VM_DRAW)

	-- Play the deploy sound
	self:EmitSound(self.Sound_Deploy)

	-- Set the cooldown
	self:SetNextPrimaryFire(CurTime() + self:GetOwner():GetViewModel():SequenceDuration())

	-- Return true to allow switching away from this weapon using lastinv command
	return true
end



-- Check if the weapon is lowered
function SWEP:GetLowered()
	return not self:GetOwner():KeyDown(IN_ATTACK2)
end



-- Check if we can use primary attack
function SWEP:CanPrimaryAttack()
	-- Check if the weapon is lowered
	return not self:GetLowered()
end



-- Called when a player presses +attack1
function SWEP:PrimaryAttack()
	-- Check if we can use primary attack
	if not self:CanPrimaryAttack() then return end

	-- Play the default attack animation
	self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)

	-- Do the worldmodel animation
	self:GetOwner():SetAnimation(PLAYER_ATTACK1)

	-- Set the cooldowns
	self:SetNextPrimaryFire(CurTime() + self:GetOwner():GetViewModel():SequenceDuration())
	self:SetAnimationDelay(CurTime() + self:GetOwner():GetViewModel():SequenceDuration())

	-- Start a trace
	local trace = util.TraceLine({
		start = self:GetOwner():GetShootPos(),
		endpos = self:GetOwner():GetShootPos() + self:GetOwner():GetAimVector() * 50,
		filter = self:GetOwner(),
		mask = MASK_SHOT
	})

	-- Check if we hit something
	if trace.Hit then
		-- Check if we hit a player
		if trace.Entity:IsPlayer() or string.find(trace.Entity:GetClass(), "prop_ragdoll") then
			-- Emit the hit sound
			self:EmitSound(self.Sound_Hit)

			-- Create damage info
			local dmginfo = DamageInfo()
			dmginfo:SetAttacker(self:GetOwner())
			dmginfo:SetInflictor(self)
			dmginfo:SetDamage(self.Damage)
			dmginfo:SetDamageForce(trace.Normal)
			dmginfo:SetDamageType(self.DamageType)
			dmginfo:SetDamagePosition(trace.HitPos)

			-- Apply damage info
			trace.Entity:TakeDamageInfo(dmginfo)
		else
			-- Emit the hit wall sound
			self:EmitSound(self.Sound_Wall)

			-- Create a cut in the wall
			util.Decal("ManhackCut", trace.HitPos + trace.HitNormal, trace.HitPos - trace.HitNormal)
		end
	else
		-- Emit the miss sound
		self:EmitSound(self.Sound_Miss)
	end
end
