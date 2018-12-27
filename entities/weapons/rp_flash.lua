AddCSLuaFile()

-- Base info
SWEP.Base						= "rp_base_grenade"

-- Spawnmenu info
SWEP.Category					= "Roleplay Weapons"
SWEP.Spawnable					= true
SWEP.AdminOnly					= true
SWEP.DisableDuplicator			= true

-- Weapon selection menu info
SWEP.AutoSwitchFrom				= false
SWEP.AutoSwitchTo				= false

-- Print info
SWEP.PrintName					= "Flashbang"
SWEP.Author						= "Arkten"

-- Viewport info
SWEP.ViewModel					= "models/weapons/cstrike/c_eq_flashbang.mdl"
SWEP.WorldModel					= "models/weapons/w_eq_flashbang.mdl"

-- Misc info
SWEP.Primary.Ammo				= "Flashbang"
SWEP.GrenadeType				= "rp_ent_flash"

-- Weapon icon info
if CLIENT then
	SWEP.WepSelectIcon			= surface.GetTextureID("weapons/flash")
end
