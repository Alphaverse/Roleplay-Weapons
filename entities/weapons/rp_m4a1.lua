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
SWEP.PrintName					= "M4A1"
SWEP.Author						= "Arkten"

-- Viewport info
SWEP.ViewModel					= "models/weapons/cstrike/c_rif_m4a1.mdl"
SWEP.WorldModel					= "models/weapons/w_rif_m4a1.mdl"
SWEP.HoldType					= "ar2"
SWEP.CSMuzzleFlashes			= true
SWEP.CSMuzzleX					= false

-- Primary info
SWEP.Primary.Ammo				= "5.56x45mm NATO"
SWEP.Primary.ClipSize			= 30
SWEP.Primary.Automatic			= true
SWEP.Primary.RPM				= 950
SWEP.Primary.NumShots			= 1
SWEP.Primary.SpreadIncrease		= 0.02

-- Sound info
SWEP.Sound_Single				= Sound("Weapon_M4A1.Single")
SWEP.Sound_Suppressed			= Sound("Weapon_M4A1.Silenced")

-- Misc info
SWEP.IsHeavyWeapon				= true
SWEP.HasSuppressor				= true

if CLIENT then
	SWEP.WepSelectIcon			= surface.GetTextureID("weapons/m4a1")
end
