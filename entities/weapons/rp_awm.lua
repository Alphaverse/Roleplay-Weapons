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
SWEP.PrintName					= "Arctic Warfare Magnum"
SWEP.Author						= "Arkten"

-- Viewport info
SWEP.ViewModel					= "models/weapons/cstrike/c_snip_awp.mdl"
SWEP.WorldModel					= "models/weapons/w_snip_awp.mdl"
SWEP.HoldType					= "ar2"
SWEP.CSMuzzleFlashes			= true
SWEP.CSMuzzleX					= false

-- Primary info
SWEP.Primary.Ammo				= ".338 Lapua Magnum"
SWEP.Primary.ClipSize			= 5
SWEP.Primary.Automatic			= false
SWEP.Primary.RPM				= 45
SWEP.Primary.NumShots			= 1
SWEP.Primary.SpreadIncrease		= 0.005

-- Sound info
SWEP.Sound_Single				= Sound("Weapon_AWP.Single")

-- Misc info
SWEP.IsHeavyWeapon				= true
SWEP.HasSuppressor				= false
SWEP.RedDot						= true
SWEP.ScopeZoom					= 80
SWEP.ScopeTime					= 0.3

if CLIENT then
	SWEP.WepSelectIcon			= surface.GetTextureID("weapons/awm")
end
