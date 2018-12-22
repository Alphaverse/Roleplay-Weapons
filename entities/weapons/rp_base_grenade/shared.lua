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
SWEP.PrintName					= "Roleplay Weapons Grenade Base"
SWEP.Author						= "Arkten"

-- Viewport info
SWEP.ViewModel					= "models/weapons/cstrike/c_eq_fraggrenade.mdl"
SWEP.WorldModel					= "models/weapons/w_eq_fraggrenade.mdl"
SWEP.HoldType					= "grenade"
SWEP.CSMuzzleFlashes			= false
SWEP.CSMuzzleX					= false

-- Primary info
SWEP.Primary.Ammo				= "Test Ammo Grenade"
SWEP.Primary.ClipSize			= -1
SWEP.Primary.DefaultClip		= 1
SWEP.Primary.Automatic			= false
SWEP.Primary.RPM				= -1
SWEP.Primary.NumShots			= -1
SWEP.Primary.Cone				= -1
SWEP.Primary.SpreadIncrease		= -1

-- Misc info
SWEP.IsHeavyWeapon				= false
SWEP.HasSuppressor				= false
SWEP.GrenadeType				= "rp_ent_base_grenade"





-- Get your grenade out
function SWEP:Deploy()
	-- Play the draw animation
	self:SendWeaponAnim(ACT_VM_DRAW)

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

	-- Do the viewmodel animation
	self:SendWeaponAnim(ACT_VM_PULLPIN)

	-- Set the cooldowns
	self:SetNextPrimaryFire(CurTime() + self:GetOwner():GetViewModel():SequenceDuration())
	self:SetAnimationDelay(CurTime() + self:GetOwner():GetViewModel():SequenceDuration())

	-- Wait for the animation to finish
	timer.Simple(self:GetOwner():GetViewModel():SequenceDuration(), function()
		-- Safety Check
		if not IsValid(self) or not IsValid(self:GetOwner()) then return end

		-- Do the throw animation
		self:GetOwner():SetAnimation(PLAYER_ATTACK1)

		-- Check if we are on the server
		if SERVER then
			-- Create the grenade
			local grenade = ents.Create(self.GrenadeType)
			grenade:SetPos(self:GetOwner():GetShootPos())
			grenade:SetAngles(self:GetOwner():GetAngles())
			grenade:SetOwner(self:GetOwner())
			grenade:Spawn()
			grenade:Activate()

			-- Apply physics force
			local phys = grenade:GetPhysicsObject()
			phys:ApplyForceCenter(self:GetOwner():GetAimVector() * 1000)
			phys:AddAngleVelocity(VectorRand() * 1000)
		end

		-- Remove a grenade from the total ammo count
		self:GetOwner():RemoveAmmo(1, self.Primary.Ammo)

		-- Check if we have another grenade
		if self:GetOwner():GetAmmoCount(self.Primary.Ammo) > 0 then
			-- Grab a new grenade
			self:SendWeaponAnim(ACT_VM_DRAW)

			-- Set the cooldown
			self:SetNextPrimaryFire(CurTime() + self:GetOwner():GetViewModel():SequenceDuration())
		else
			if SERVER then
				-- Remove this SWEP
				self:Remove()
			end
		end
	end)
end
