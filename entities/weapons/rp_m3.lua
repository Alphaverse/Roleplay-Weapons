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
SWEP.PrintName					= "Benelli M3 Super 90"
SWEP.Author						= "Arkten"

-- Viewport info
SWEP.ViewModel					= "models/weapons/cstrike/c_shot_m3super90.mdl"
SWEP.WorldModel					= "models/weapons/w_shot_m3super90.mdl"
SWEP.HoldType					= "shotgun"
SWEP.CSMuzzleFlashes			= true
SWEP.CSMuzzleX					= false

-- Primary info
SWEP.Primary.Ammo				= "12 gauge"
SWEP.Primary.ClipSize			= 8
SWEP.Primary.Automatic			= false
SWEP.Primary.RPM				= 65
SWEP.Primary.NumShots			= 12
SWEP.Primary.SpreadIncrease		= 0.02

-- Sound info
SWEP.Sound_Single				= Sound("Weapon_M3.Single")

-- Misc info
SWEP.IsHeavyWeapon				= true
SWEP.HasSuppressor				= false

-- Weapon icon info
if CLIENT then
	SWEP.WepSelectIcon			= surface.GetTextureID("weapons/m3")
end
