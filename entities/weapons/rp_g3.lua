AddCSLuaFile()

-- Base info
SWEP.Base						= "rp_base_sniper"

-- Spawnmenu info
SWEP.Category					= "Roleplay Weapons"
SWEP.Spawnable					= true
SWEP.AdminOnly					= true
SWEP.DisableDuplicator			= true

-- Weapon selection menu info
SWEP.AutoSwitchFrom				= false
SWEP.AutoSwitchTo				= false

-- Print info
SWEP.PrintName					= "Heckler & Koch G3SG/1"
SWEP.Author						= "Arkten"

-- Viewport info
SWEP.ViewModel					= "models/weapons/cstrike/c_snip_g3sg1.mdl"
SWEP.WorldModel					= "models/weapons/w_snip_g3sg1.mdl"
SWEP.HoldType					= "ar2"
SWEP.CSMuzzleFlashes			= true
SWEP.CSMuzzleX					= false

-- Primary info
SWEP.Primary.Ammo				= "7.62x51mm NATO"
SWEP.Primary.ClipSize			= 20
SWEP.Primary.Automatic			= true
SWEP.Primary.RPM				= 200
SWEP.Primary.NumShots			= 1
SWEP.Primary.SpreadIncrease		= 0.005

-- Sound info
SWEP.Sound_Single				= Sound("Weapon_G3SG1.Single")

-- Misc info
SWEP.IsHeavyWeapon				= true
SWEP.HasSuppressor				= false
SWEP.RedDot						= false
SWEP.ScopeZoom					= 80
SWEP.ScopeTime					= 0.3

-- Weapon icon info
if CLIENT then
	SWEP.WepSelectIcon			= surface.GetTextureID("weapons/g3")
end
