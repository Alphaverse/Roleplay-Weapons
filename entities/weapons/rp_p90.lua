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
SWEP.PrintName					= "FN P90"
SWEP.Author						= "Arkten"

-- Viewport info
SWEP.ViewModel					= "models/weapons/cstrike/c_smg_p90.mdl"
SWEP.WorldModel					= "models/weapons/w_smg_p90.mdl"
SWEP.HoldType					= "smg"
SWEP.CSMuzzleFlashes			= true
SWEP.CSMuzzleX					= false

-- Primary info
SWEP.Primary.Ammo				= "FN 5.7x28mm"
SWEP.Primary.ClipSize			= 50
SWEP.Primary.Automatic			= true
SWEP.Primary.RPM				= 900
SWEP.Primary.NumShots			= 1
SWEP.Primary.SpreadIncrease		= 0.02

-- Sound info
SWEP.Sound_Single				= Sound("Weapon_P90.Single")

-- Misc info
SWEP.IsHeavyWeapon				= true
SWEP.HasSuppressor				= false
SWEP.RedDot						= true
SWEP.ScopeZoom					= 40
SWEP.ScopeTime					= 0.3

if CLIENT then
	SWEP.WepSelectIcon			= surface.GetTextureID("weapons/p90")
end
