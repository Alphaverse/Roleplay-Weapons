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
SWEP.PrintName					= "SIG SG550-1"
SWEP.Author						= "Arkten"

-- Viewport info
SWEP.ViewModel					= "models/weapons/cstrike/c_snip_sg550.mdl"
SWEP.WorldModel					= "models/weapons/w_snip_sg550.mdl"
SWEP.HoldType					= "ar2"
SWEP.CSMuzzleFlashes			= true
SWEP.CSMuzzleX					= false

-- Primary info
SWEP.Primary.Ammo				= "5.56x45mm NATO"
SWEP.Primary.ClipSize			= 20
SWEP.Primary.Automatic			= true
SWEP.Primary.RPM				= 250
SWEP.Primary.NumShots			= 1
SWEP.Primary.SpreadIncrease		= 0.005

-- Sound info
SWEP.Sound_Single				= Sound("Weapon_SG550.Single")

-- Misc info
SWEP.IsHeavyWeapon				= true
SWEP.HasSuppressor				= false
SWEP.RedDot						= false
SWEP.ScopeZoom					= 80
SWEP.ScopeTime					= 0.3

if CLIENT then
	SWEP.WepSelectIcon			= surface.GetTextureID("weapons/sg550")
end
