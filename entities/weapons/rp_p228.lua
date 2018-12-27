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
SWEP.PrintName					= "SIG Sauer P228"
SWEP.Author						= "Arkten"

-- Viewport info
SWEP.ViewModel					= "models/weapons/cstrike/c_pist_p228.mdl"
SWEP.WorldModel					= "models/weapons/w_pist_p228.mdl"
SWEP.HoldType					= "pistol"
SWEP.CSMuzzleFlashes			= true
SWEP.CSMuzzleX					= false

-- Primary info
SWEP.Primary.Ammo				= "9x19mm Parabellum"
SWEP.Primary.ClipSize			= 13
SWEP.Primary.Automatic			= false
SWEP.Primary.RPM				= 600
SWEP.Primary.NumShots			= 1
SWEP.Primary.SpreadIncrease		= 0.02

-- Sound info
SWEP.Sound_Single				= Sound("Weapon_P228.Single")

-- Misc info
SWEP.IsHeavyWeapon				= false
SWEP.HasSuppressor				= false

-- Weapon icon info
if CLIENT then
	SWEP.WepSelectIcon			= surface.GetTextureID("weapons/p228")
end
