AddCSLuaFile()

-- Base info
SWEP.Base						= "rp_base_shotgun"

-- Spawnmenu info
SWEP.Category					= "Roleplay Weapons"
SWEP.Spawnable					= true
SWEP.AdminOnly					= true
SWEP.DisableDuplicator			= true

-- Weapon selection menu info
SWEP.AutoSwitchFrom				= false
SWEP.AutoSwitchTo				= false

-- Print info
SWEP.PrintName					= "Benelli M4 Super 90"
SWEP.Author						= "Arkten"

-- Viewport info
SWEP.ViewModel					= "models/weapons/cstrike/c_shot_xm1014.mdl"
SWEP.WorldModel					= "models/weapons/w_shot_xm1014.mdl"
SWEP.HoldType					= "shotgun"
SWEP.CSMuzzleFlashes			= true
SWEP.CSMuzzleX					= false

-- Primary info
SWEP.Primary.Ammo				= "12 gauge"
SWEP.Primary.ClipSize			= 7
SWEP.Primary.Automatic			= true
SWEP.Primary.RPM				= 150
SWEP.Primary.NumShots			= 12
SWEP.Primary.SpreadIncrease		= 0.02

-- Sound info
SWEP.Sound_Single				= Sound("Weapon_XM1014.Single")

-- Misc info
SWEP.IsHeavyWeapon				= true
SWEP.HasSuppressor				= false

-- Weapon icon info
if CLIENT then
	SWEP.WepSelectIcon			= surface.GetTextureID("weapons/m4")
end
