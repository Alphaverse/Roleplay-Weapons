AddCSLuaFile()
AddCSLuaFile("ammo.lua")
AddCSLuaFile("cl_init.lua")
include("ammo.lua")

-- Base info
SWEP.Base						= "weapon_base"

-- Spawnmenu info
SWEP.Category					= "Roleplay Weapons"
SWEP.Spawnable					= true
SWEP.AdminOnly					= true
SWEP.DisableDuplicator			= true

-- Weapon selection menu info
SWEP.AutoSwitchFrom				= false
SWEP.AutoSwitchTo				= false

-- Print info
SWEP.PrintName					= "Roleplay Weapons Base"
SWEP.Author						= "Arkten"

-- Viewport info
SWEP.ViewModel					= "models/weapons/c_pistol.mdl"
SWEP.WorldModel					= "models/weapons/w_pistol.mdl"
SWEP.UseHands					= true
SWEP.HoldType					= "pistol"
SWEP.CSMuzzleFlashes			= true
SWEP.CSMuzzleX					= false

-- Primary info
SWEP.Primary.Ammo				= "Test Ammo"
SWEP.Primary.ClipSize			= 12
SWEP.Primary.DefaultClip		= 0
SWEP.Primary.Automatic			= false
SWEP.Primary.RPM				= 600
SWEP.Primary.NumShots			= 1
SWEP.Primary.Cone				= 0
SWEP.Primary.SpreadIncrease		= 0.02

-- Secondary info
SWEP.Secondary.Ammo				= "none"
SWEP.Secondary.ClipSize			= -1
SWEP.Secondary.DefaultClip		= -1
SWEP.Secondary.Automatic		= true

-- Sound info
SWEP.Sound_Single				= Sound("Weapon_Pistol.Single")
SWEP.Sound_Empty				= Sound("Weapon_Pistol.Empty")
SWEP.Sound_Suppressed			= Sound("Weapon_USP.SilencedShot")
SWEP.Sound_Toggle				= Sound("Weapon_Glock.Sliderelease")

-- Lowering info
SWEP.LowerPosition				= Vector(0, 0, 5)
SWEP.LowerAngle					= Angle(25, 0, 0)
SWEP.LowerTime					= 0.18

-- Misc info
SWEP.IsHeavyWeapon				= false
SWEP.HasSuppressor				= false

-- Table for holding all single-handed hold types
SWEP.SingleHandHoldTypes = {}
SWEP.SingleHandHoldTypes["pistol"] = true
SWEP.SingleHandHoldTypes["grenade"] = true
SWEP.SingleHandHoldTypes["melee"] = true
SWEP.SingleHandHoldTypes["fist"] = true
SWEP.SingleHandHoldTypes["melee2"] = true
SWEP.SingleHandHoldTypes["knife"] = true
SWEP.SingleHandHoldTypes["camera"] = true
SWEP.SingleHandHoldTypes["magic"] = true
SWEP.SingleHandHoldTypes["revolver"] = true
SWEP.SingleHandHoldTypes["duel"] = true





-- Set up network variables
function SWEP:SetupDataTables()
	-- Whether or not the weapon is currently suppressedby an attachable suppressor
	self:NetworkVar("Bool", 0, "Suppressed")

	-- Whether or not the weapon is lowered
	self:NetworkVar("Bool", 1, "Lowered")

	-- Indicates the time we are able to play our next animation so we do not interrupt
	self:NetworkVar("Float", 0, "AnimationDelay")
end



-- Called when the weapon is initializing
function SWEP:Initialize()
	-- Initialize network variables
	self:SetSuppressed(false)
	self:SetLowered(true)
	self:SetAnimationDelay(0)

	-- Override SWEP.GetLowered in Initialize after the data table has been set up
	function self:GetLowered()
		-- Check if the weapon is lowered
		return not self:GetOwner():KeyDown(IN_ATTACK2) or self:GetOwner():IsSprinting()
	end

	-- Set the weapon's holdtype
	self:SetHoldType(self.HoldType)

	-- Register if the weapon is automatic
	self.HasAutoMode = self.Primary.Automatic
end



-- Get your gun out
function SWEP:Deploy()
	-- Check if we have a suppressor on us
	if self:GetSuppressed() then
		-- Play suppressed idle animation so that the draw animation does not play
		self:SendWeaponAnim(ACT_VM_IDLE_SILENCED)
	else
		-- Play default idle animation so that the draw animation does not play
		self:SendWeaponAnim(ACT_VM_IDLE)
	end

	-- Return true to allow switching away from this weapon using lastinv command
	return true
end



-- Disable switching weapons while doing an animation
function SWEP:Holster()
	return self:GetAnimationDelay() < CurTime()
end



-- Called whenever +reload is pressed
function SWEP:Reload()
	-- Return if we are doing an animation
	if self:GetAnimationDelay() >= CurTime() then return end

	-- Check if we have ammo left
	if self:GetOwner():GetAmmoCount(self.Primary.Ammo) > 0 then
		-- Check if we have a suppressor on us
		if self:GetSuppressed() then
			-- Play the suppressed reload animation
			self:SendWeaponAnim(ACT_VM_RELOAD_SILENCED)
		else
			-- Play the default reload animation
			self:SendWeaponAnim(ACT_VM_RELOAD)
		end

		-- Reset holdtype so the animation can play
		self:SetHoldType(self.HoldType)

		-- Play the worldmodel animation
		self:GetOwner():SetAnimation(PLAYER_RELOAD)

		-- Set the cooldowns
		self:SetNextPrimaryFire(CurTime() + self:GetOwner():GetViewModel():SequenceDuration())
		self:SetNextSecondaryFire(CurTime() + self:GetOwner():GetViewModel():SequenceDuration())
		self:SetAnimationDelay(CurTime() + self:GetOwner():GetViewModel():SequenceDuration())

		-- Wait for the reload to finish
		timer.Simple(self:GetOwner():GetViewModel():SequenceDuration(), function()
			-- Safety check
			if IsValid(self) and IsValid(self:GetOwner()) then
				-- Do not throw away full magazines
				if self:Clip1() != self.Primary.ClipSize then
					-- Subtract a full magazine from the ammo we have left
					self:GetOwner():SetAmmo(self:GetOwner():GetAmmoCount(self:GetPrimaryAmmoType()) - self.Primary.ClipSize, self:GetPrimaryAmmoType())
				end

				-- Make the magazine full
				self:SetClip1(self.Primary.ClipSize)
			end
		end)
	end
end



-- Called every frame after the think
function SWEP:PostThink()
end



-- Called every frame
function SWEP:Think()
	-- Reduce Spread over time
	self.Primary.Cone = math.Clamp(self.Primary.Cone - (self.Primary.SpreadIncrease / 20), 0, 1)

	-- Return if we are doing an animation
	if self:GetAnimationDelay() >= CurTime() then
		-- Call post think
		self:PostThink()

		-- Return so that we don't interrupt the animations
		return
	end

	-- Check if we have our weapon lowered
	if self:GetLowered() then
		-- Check if it is a single-handed weapon or if we are ducking or if we are under water
		if self.SingleHandHoldTypes[self.HoldType] or self:GetOwner():KeyDown(IN_DUCK) or self:GetOwner():WaterLevel() == 3 then
			-- Set the holdtype to be normal
			self:SetHoldType("normal")
		else
			-- Set the holdtype to be passive
			self:SetHoldType("passive")
		end
	else
		-- Reset our holdtype as we are just aiming normally
		self:SetHoldType(self.HoldType)
	end

	-- Call post think
	self:PostThink()
end



-- Called before animation events are fired
function SWEP:FireAnimationEvent(pos, ang, event, options)
	-- Disables animation based muzzle event when weapon is suppressed
	if event == 21 and self:GetSuppressed() then return true end

	-- Disable thirdperson muzzle flash when weapon is suppressed
	if event == 5003 and self:GetSuppressed() then return true end

	-- Check if the animation is a muzzle flash event
	if event == 5001 or event == 5011 or event == 5021 or event == 5031 then
		-- Disable muzzle flash when we have a suppresoor on us
		if self:GetSuppressed() then return true end

		-- Check if we use CS-like muzzle flashes
		if self.CSMuzzleFlashes then
			-- Create the effect data
			local data = EffectData()
			data:SetFlags(0)
			data:SetEntity(self:GetOwner():GetViewModel())
			data:SetAttachment(math.floor((event - 4991) / 10))
			data:SetScale(1)

			-- Check if we use the X-shaped CS-like muzzle flashes
			if self.CSMuzzleX then
				-- Fire the X-shaped CS-like muzzle flash
				util.Effect("CS_MuzzleFlash_X", data)
			else
				-- Fire the default CS-like muzzle flash
				util.Effect("CS_MuzzleFlash", data)
			end

			-- Return true to override the current animation event
			return true
		end
	end
end



-- Check if we can use primary attack
function SWEP:CanPrimaryAttack()
	-- Check if we are under water or the weapon is lowered
	if self:GetOwner():WaterLevel() == 3 or self:GetLowered() then
		return false
	elseif self:Clip1() <= 0 then
		-- Emit the empty clip sound as we have no ammo
		self:EmitSound(self.Sound_Empty)

		-- Return false as we have nothing to shoot
		return false
	end

	-- Return true to allow primary attack
	return true
end



-- Check if we can use secondary attack
function SWEP:CanSecondaryAttack()
	-- Return whether we have a suppressor
	return self.HasSuppressor
end



-- Called when a player presses +attack1
function SWEP:PrimaryAttack()
	-- Switch fire modes with +use and +attack1
	if self:GetOwner():KeyDown(IN_USE) and self.HasAutoMode then
		-- Set the cooldowns
		self:SetNextPrimaryFire(CurTime() + 2 * self.LowerTime)
		self:SetNextSecondaryFire(CurTime() + 2 * self.LowerTime)

		-- Toggle fire modes
		self.Primary.Automatic = not self.Primary.Automatic

		-- Play the toggle sound
		self:EmitSound(self.Sound_Toggle)

		-- Return as we do not want to shoot
		return
	end

	-- Set the shoot cooldown using the weapon's RPM
	self:SetNextPrimaryFire(CurTime() + (60 / self.Primary.RPM))

	-- Check if we can shoot
	if not self:CanPrimaryAttack() then return end

	-- Check if we have a suppressor on us
	if self:GetSuppressed() then
		-- Play the suppressed sound
		self:EmitSound(self.Sound_Suppressed)
	else
		-- Play the default sound
		self:EmitSound(self.Sound_Single)
	end

	-- Take one bullet
	self:TakePrimaryAmmo(1)

	-- Shoot the bullet
	self:ShootBullet()
end



-- Called when a player presses +attack2
function SWEP:SecondaryAttack()
	-- Check if we can attach or detach a suppressor
	if not self:CanSecondaryAttack() then return end

	-- Use a suppressor with +use and +attack2
	if self:GetOwner():KeyDown(IN_USE) then
		-- Get the suppress bool
		local ShouldSuppress = not self:GetSuppressed()

		-- Toggle suppressing
		self:SetSuppressed(ShouldSuppress)

		-- Check if this weapon should be suppressed
		if ShouldSuppress then
			-- Play the attach animation
			self:SendWeaponAnim(ACT_VM_ATTACH_SILENCER)
		else
			-- Play the detach animation
			self:SendWeaponAnim(ACT_VM_DETACH_SILENCER)
		end

		-- Set the cooldowns
		self:SetNextPrimaryFire(CurTime() + self:GetOwner():GetViewModel():SequenceDuration())
		self:SetNextSecondaryFire(CurTime() + self:GetOwner():GetViewModel():SequenceDuration())
		self:SetAnimationDelay(CurTime() + self:GetOwner():GetViewModel():SequenceDuration())

		-- Return as we do not want to shoot
		return
	end
end



-- Called to create the shoot effects
function SWEP:ShootEffects()
	-- Check if we have a suppressor on us
	if self:GetSuppressed() then
		-- Play the suppressed attack animation
		self:SendWeaponAnim(ACT_VM_PRIMARYATTACK_SILENCED)
	else
		-- Play the default attack animation
		self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
	end

	-- Draw the muzzle flash
	self:GetOwner():MuzzleFlash()

	-- Do the worldmodel animation
	self:GetOwner():SetAnimation(PLAYER_ATTACK1)
end



-- Called whenever this weapon shoots a bullet
function SWEP:ShootBullet()
	-- Add spread
	self.Primary.Cone = math.Clamp(self.Primary.Cone + self.Primary.SpreadIncrease, 0, 1)

	-- Get the force specified by the ammo type
	local force = game.GetAmmoForce(self:GetPrimaryAmmoType())

	-- Create bullet data
	local bullet = {
		Num = self.Primary.NumShots,
		Src = self:GetOwner():GetShootPos(),
		Dir = self:GetOwner():GetAimVector(),
		AmmoType = self.Primary.Ammo,
		Spread = Vector(self.Primary.Cone * self.Primary.NumShots, self.Primary.Cone * self.Primary.NumShots, 0),
		Tracer = 0,
		Force = force,
		Damage = force
	}

	-- Fire the bullet
	self:GetOwner():FireBullets(bullet)

	-- Do the effects
	self:ShootEffects()

	-- Get the player's eye angles
	local eyeang = self:GetOwner():EyeAngles()

	-- Shift the pitch depending on the force
	eyeang.pitch = eyeang.pitch - force / 50

	-- Apply new angles
	self:GetOwner():SetEyeAngles(eyeang)

	-- Viewpunch the player
	self:GetOwner():ViewPunch(Angle(-1, 0, 0))
end
