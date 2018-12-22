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
SWEP.PrintName					= "Ingram MAC-10"
SWEP.Author						= "Arkten"

-- Viewport info
SWEP.ViewModel					= "models/weapons/cstrike/c_smg_mac10.mdl"
SWEP.WorldModel					= "models/weapons/w_smg_mac10.mdl"
SWEP.HoldType					= "pistol"
SWEP.CSMuzzleFlashes			= true
SWEP.CSMuzzleX					= false

-- Primary info
SWEP.Primary.Ammo				= ".45 ACP"
SWEP.Primary.ClipSize			= 30
SWEP.Primary.Automatic			= true
SWEP.Primary.RPM				= 1090
SWEP.Primary.NumShots			= 1
SWEP.Primary.SpreadIncrease		= 0.02

-- Sound info
SWEP.Sound_Single				= Sound("Weapon_MAC10.Single")

-- Misc info
SWEP.IsHeavyWeapon				= false
SWEP.HasSuppressor				= false

if CLIENT then
	SWEP.WepSelectIcon			= surface.GetTextureID("weapons/mac10")
end
