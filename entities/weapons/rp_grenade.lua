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
SWEP.PrintName					= "Frag Grenade"
SWEP.Author						= "Arkten"

-- Viewport info
SWEP.ViewModel					= "models/weapons/cstrike/c_eq_fraggrenade.mdl"
SWEP.WorldModel					= "models/weapons/w_eq_fraggrenade.mdl"

-- Misc info
SWEP.Primary.Ammo				= "Frag Grenade"
SWEP.GrenadeType				= "rp_ent_grenade"

-- Weapon icon info
if CLIENT then
	SWEP.WepSelectIcon			= surface.GetTextureID("weapons/grenade")
end
