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
SWEP.PrintName					= "IMI Desert Eagle"
SWEP.Author						= "Arkten"

-- Viewport info
SWEP.ViewModel					= "models/weapons/cstrike/c_pist_deagle.mdl"
SWEP.WorldModel					= "models/weapons/w_pist_deagle.mdl"
SWEP.HoldType					= "pistol"
SWEP.CSMuzzleFlashes			= true
SWEP.CSMuzzleX					= false

-- Primary info
SWEP.Primary.Ammo				= ".50 AE"
SWEP.Primary.ClipSize			= 7
SWEP.Primary.Automatic			= false
SWEP.Primary.RPM				= 300
SWEP.Primary.NumShots			= 1
SWEP.Primary.SpreadIncrease		= 0.02

-- Sound info
SWEP.Sound_Single				= Sound("Weapon_DEagle.Single")

-- Misc info
SWEP.IsHeavyWeapon				= false
SWEP.HasSuppressor				= false

if CLIENT then
	SWEP.WepSelectIcon			= surface.GetTextureID("weapons/deagle")
end
