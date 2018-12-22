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
SWEP.PrintName					= "Steyr TMP"
SWEP.Author						= "Arkten"

-- Viewport info
SWEP.ViewModel					= "models/weapons/cstrike/c_smg_tmp.mdl"
SWEP.WorldModel					= "models/weapons/w_smg_tmp.mdl"
SWEP.HoldType					= "pistol"
SWEP.CSMuzzleFlashes			= true
SWEP.CSMuzzleX					= false

-- Primary info
SWEP.Primary.Ammo				= "9x19mm Parabellum"
SWEP.Primary.ClipSize			= 20
SWEP.Primary.Automatic			= true
SWEP.Primary.RPM				= 900
SWEP.Primary.NumShots			= 1
SWEP.Primary.SpreadIncrease		= 0.02

-- Sound info
SWEP.Sound_Single				= Sound("Weapon_TMP.Single")

-- Misc info
SWEP.IsHeavyWeapon				= false
SWEP.HasSuppressor				= false

if CLIENT then
	SWEP.WepSelectIcon			= surface.GetTextureID("weapons/tmp")
end
