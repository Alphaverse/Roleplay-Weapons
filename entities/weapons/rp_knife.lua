AddCSLuaFile()

-- Base info
SWEP.Base						= "rp_base_melee"

-- Spawnmenu info
SWEP.Category					= "Roleplay Weapons"
SWEP.Spawnable					= true
SWEP.AdminOnly					= true
SWEP.DisableDuplicator			= true

-- Weapon selection menu info
SWEP.AutoSwitchFrom				= false
SWEP.AutoSwitchTo				= false

-- Weapon selection menu info
SWEP.PrintName					= "Knife"
SWEP.Author						= "Arkten"

-- Viewport info
SWEP.ViewModel					= "models/weapons/cstrike/c_knife_t.mdl"
SWEP.WorldModel					= "models/weapons/w_knife_t.mdl"
SWEP.HoldType					= "knife"

-- Sound info
SWEP.Sound_Deploy				= Sound("Weapon_Knife.Deploy")
SWEP.Sound_Hit					= Sound("Weapon_Knife.Hit")
SWEP.Sound_Wall					= Sound("Weapon_Knife.HitWall")
SWEP.Sound_Miss					= Sound("Weapon_Knife.Slash")

-- Misc info
SWEP.Damage						= 40
SWEP.DamageType					= DMG_SLASH

-- Weapon icon info
if CLIENT then
	SWEP.WepSelectIcon			= surface.GetTextureID("weapons/knife")
end
