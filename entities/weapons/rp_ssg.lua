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
SWEP.PrintName					= "Steyr SSG 08"
SWEP.Author						= "Arkten"

-- Viewport info
SWEP.ViewModel					= "models/weapons/cstrike/c_snip_scout.mdl"
SWEP.WorldModel					= "models/weapons/w_snip_scout.mdl"
SWEP.HoldType					= "ar2"
SWEP.CSMuzzleFlashes			= true
SWEP.CSMuzzleX					= false

-- Primary info
SWEP.Primary.Ammo				= ".338 Lapua Magnum"
SWEP.Primary.ClipSize			= 6
SWEP.Primary.Automatic			= false
SWEP.Primary.RPM				= 50
SWEP.Primary.NumShots			= 1
SWEP.Primary.SpreadIncrease		= 0.005

-- Sound info
SWEP.Sound_Single				= Sound("Weapon_Scout.Single")

-- Misc info
SWEP.IsHeavyWeapon				= true
SWEP.HasSuppressor				= false
SWEP.RedDot						= false
SWEP.ScopeZoom					= 80
SWEP.ScopeTime					= 0.3

if CLIENT then
	SWEP.WepSelectIcon			= surface.GetTextureID("weapons/ssg")
end
