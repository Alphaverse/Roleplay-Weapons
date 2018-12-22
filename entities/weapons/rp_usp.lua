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
SWEP.PrintName					= "Heckler & Koch USP"
SWEP.Author						= "Arkten"

-- Viewport info
SWEP.ViewModel					= "models/weapons/cstrike/c_pist_usp.mdl"
SWEP.WorldModel					= "models/weapons/w_pist_usp.mdl"
SWEP.HoldType					= "pistol"
SWEP.CSMuzzleFlashes			= true
SWEP.CSMuzzleX					= false

-- Primary info
SWEP.Primary.Ammo				= "9x19mm Parabellum"
SWEP.Primary.ClipSize			= 15
SWEP.Primary.Automatic			= false
SWEP.Primary.RPM				= 600
SWEP.Primary.NumShots			= 1
SWEP.Primary.SpreadIncrease		= 0.02

-- Sound info
SWEP.Sound_Single				= Sound("Weapon_USP.Single")
SWEP.Sound_Suppressed			= Sound("Weapon_USP.SilencedShot")

-- Misc info
SWEP.IsHeavyWeapon				= false
SWEP.HasSuppressor				= true

if CLIENT then
	SWEP.WepSelectIcon			= surface.GetTextureID("weapons/usp")
end
