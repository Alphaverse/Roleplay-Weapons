AddCSLuaFile()

-- Base info
SWEP.Base 						= "rp_base"

-- Spawnmenu info
SWEP.Category					= "Roleplay Weapons"
SWEP.Spawnable					= true
SWEP.AdminOnly					= true
SWEP.DisableDuplicator			= true

-- Weapon selection menu info
SWEP.AutoSwitchFrom				= false
SWEP.AutoSwitchTo				= false

-- Print info
SWEP.PrintName					= "Roleplay Weapons Shotgun Base"
SWEP.Author						= "Arkten"

-- Viewport info
SWEP.ViewModel					= "models/weapons/c_pistol.mdl"
SWEP.WorldModel					= "models/weapons/w_pistol.mdl"





-- Enable switching weapons while doing an animation
function SWEP:SetupDataTables()
	-- Whether or not the weapon is currently suppressedby an attachable suppressor
	self:NetworkVar("Bool", 0, "Suppressed")

	-- Whether or not the weapon is lowered
	self:NetworkVar("Bool", 1, "Lowered")

	-- Indicates the time we are able to play our next animation so we do not interrupt
	self:NetworkVar("Float", 0, "AnimationDelay")

	-- Whether or not we are currently reloading
	self:NetworkVar("Bool", 2, "Reloading")

	-- When the next reload animation will be
	self:NetworkVar("Float", 1, "NextReload")
end



-- Called when the weapon is initializing
function SWEP:Initialize()
	-- Initialize network variables
	self:SetSuppressed(false)
	self:SetLowered(true)
	self:SetAnimationDelay(0)
	self:SetReloading(false)
	self:SetNextReload(0)

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



-- Enable switching weapons while doing an animation
function SWEP:Holster()
	return true
end



-- Called every frame
function SWEP:Think()
	-- Reduce Spread over time
	self.Primary.Cone = math.Clamp(self.Primary.Cone - (self.Primary.SpreadIncrease / 20), 0, 1)

	-- Return if we are doing an animation
	if self:GetAnimationDelay() >= CurTime() then
		-- Call the shotgun reload fix
		self:ShotgunReload()

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

	-- Call the shotgun reload fix
	self:ShotgunReload()

	-- Call post think
	self:PostThink()
end



-- Fixes the shotgun reload (Called every frame)
function SWEP:ShotgunReload()
	-- Safety check to stop overloading
	if self:Clip1() > self.Primary.ClipSize then
		self:SetClip1(self.Primary.ClipSize)
	end

	-- Check if we are reloading a shell
	if self:GetReloading() and self:GetNextReload() < CurTime() then
		-- Check if our clip is full or we have run out of ammo
		if self:Clip1() >= self.Primary.ClipSize or self:GetOwner():GetAmmoCount(self.Primary.Ammo) <= 0 then
			-- Do the reload finish animation
			self:SendWeaponAnim(ACT_SHOTGUN_RELOAD_FINISH)

			-- Set the cooldowns
			self:SetNextPrimaryFire(CurTime() + self:GetOwner():GetViewModel():SequenceDuration())
			self:SetNextSecondaryFire(CurTime() + self:GetOwner():GetViewModel():SequenceDuration())
			self:SetAnimationDelay(CurTime() + self:GetOwner():GetViewModel():SequenceDuration())

			-- Set the reloading bool
			self:SetReloading(false)
		else
			-- Do the reload animation
			self:SendWeaponAnim(ACT_VM_RELOAD)

			-- Set the cooldowns
			local cooldown = self:GetOwner():GetViewModel():SequenceDuration()
			self:SetNextPrimaryFire(CurTime() + cooldown)
			self:SetNextSecondaryFire(CurTime() + cooldown)
			self:SetAnimationDelay(CurTime() + cooldown)
			self:SetNextReload(CurTime() + cooldown)

			-- Remove the shell from the ammo
			self:GetOwner():RemoveAmmo(1, self.Primary.Ammo)

			-- Add the shell to the clip
			self:SetClip1(self:Clip1() + 1)
		end
	end

	-- Check if we have pressed +attack while reloading
	if self:GetOwner():KeyPressed(IN_ATTACK) and self:GetReloading() then
		-- Set the reloading bool
		self:SetReloading(false)

		-- Set the cooldowns
		local curcooldown = self:GetOwner():GetViewModel():SequenceDuration()
		local nextcooldown = self:GetOwner():GetViewModel():SequenceDuration(self:GetOwner():SelectWeightedSequence(ACT_SHOTGUN_RELOAD_FINISH))
		self:SetNextPrimaryFire(CurTime() + curcooldown + nextcooldown)
		self:SetNextSecondaryFire(CurTime() + curcooldown + nextcooldown)
		self:SetAnimationDelay(CurTime() + curcooldown + nextcooldown)

		-- Do the reload finish animation
		self:SendWeaponAnim(ACT_SHOTGUN_RELOAD_FINISH)
	end
end



-- Called whenever +reload is pressed
function SWEP:Reload()
	-- Return if we are doing an animation
	if self:GetAnimationDelay() >= CurTime() then return end

	-- Check if we need to reload
	if self:Clip1() < self.Primary.ClipSize and self:GetOwner():GetAmmoCount(self.Primary.Ammo) > 0 then
		-- Reset holdtype so the animation can play
		self:SetHoldType(self.HoldType)

		-- Play the worldmodel animation
		self:GetOwner():SetAnimation(PLAYER_RELOAD)

		-- Do the reload start animation
		self:SendWeaponAnim(ACT_SHOTGUN_RELOAD_START)

		-- Set the cooldowns
		self:SetNextPrimaryFire(CurTime() + self:GetOwner():GetViewModel():SequenceDuration())
		self:SetNextSecondaryFire(CurTime() + self:GetOwner():GetViewModel():SequenceDuration())
		self:SetAnimationDelay(CurTime() + self:GetOwner():GetViewModel():SequenceDuration())

		-- Start a timer
		timer.Simple(self:GetOwner():GetViewModel():SequenceDuration(), function()
			-- Set the reloading bool
			self:SetReloading(true)
		end)
	end
end
