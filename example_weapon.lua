--[[
	THINGS YOU REALLY DO NOT WANT TO CHANGE BUT NEED TO INCLUDE ANYWAYS
--]]
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





--[[
	THINGS YOU CAN CHANGE TO YOUR LIKING
--]]
-- Print info
SWEP.PrintName					= "Test Weapon"
SWEP.Author						= "Arkten"

-- Viewport info
SWEP.ViewModel					= "models/weapons/cstrike/c_rif_ak47.mdl"
SWEP.WorldModel					= "models/weapons/w_rif_ak47.mdl"
SWEP.HoldType					= "ar2"
SWEP.CSMuzzleFlashes			= true
SWEP.CSMuzzleX					= false

-- Primary info
SWEP.Primary.Ammo				= "7.62x39mm"
SWEP.Primary.ClipSize			= 30
SWEP.Primary.Automatic			= true
SWEP.Primary.RPM				= 600
SWEP.Primary.NumShots			= 1
SWEP.Primary.SpreadIncrease		= 0.02

-- Sound info
SWEP.Sound_Single				= Sound("Weapon_AK47.Single")

-- Misc info
SWEP.IsHeavyWeapon				= true
SWEP.HasSuppressor				= false

if CLIENT then
	SWEP.WepSelectIcon			= surface.GetTextureID("weapons/ak47")
end





--[[
	GRENADES ONLY
--]]
-- Misc info
SWEP.GrenadeType				= "rp_ent_base_grenade"





--[[
	MELEE ONLY
--]]
-- Sound info
SWEP.Sound_Deploy				= Sound("Weapon_Knife.Deploy")
SWEP.Sound_Hit					= Sound("Weapon_Knife.Hit")
SWEP.Sound_Wall					= Sound("Weapon_Knife.HitWall")
SWEP.Sound_Miss					= Sound("Weapon_Knife.Slash")

-- Misc info
SWEP.Damage						= 40
SWEP.DamageType					= DMG_SLASH





--[[
	SNIPER ONLY
--]]
-- Sound info
SWEP.Sound_ZoomIn				= Sound("Weapon_AR2.Special1")
SWEP.Sound_ZoomOut				= Sound("Weapon_AR2.Special2")

-- Misc info
SWEP.RedDot						= false
SWEP.DrawCrosshair				= false
SWEP.ScopeZoom					= 80
SWEP.ScopeTime					= 0.3
