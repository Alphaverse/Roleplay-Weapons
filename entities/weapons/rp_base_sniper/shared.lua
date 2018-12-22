AddCSLuaFile()
AddCSLuaFile("cl_init.lua")

-- Base info
SWEP.Base 						= "rp_base"

-- Spawnmenu info
SWEP.Category					= "Roleplay Weapons"
SWEP.Spawnable					= true
SWEP.AdminOnly					= true
SWEP.DisableDuplicator			= true

-- Weapon selection menu info
SWEP.AutoSwitchFrom				= false
SWEP.AutoSwitchTo				= false

-- Print info
SWEP.PrintName					= "Roleplay Weapons Sniper Base"
SWEP.Author						= "Arkten"

-- Viewport info
SWEP.ViewModel					= "models/weapons/c_pistol.mdl"
SWEP.WorldModel					= "models/weapons/w_pistol.mdl"

-- Sound info
SWEP.Sound_ZoomIn				= Sound("Weapon_AR2.Special1")
SWEP.Sound_ZoomOut				= Sound("Weapon_AR2.Special2")

-- Misc info
SWEP.RedDot						= false
SWEP.DrawCrosshair				= false
SWEP.ScopeZoom					= 80
SWEP.ScopeTime					= 0.3
