--[[
	Heckler & Koch USP			9x19mm Parabellum
	Glock 18					9x19mm Parabellum
	SIG Sauer P228				9x19mm Parabellum
	FN Five-seven				FN 5.7x28mm
	IMI Desert Eagle			.50 AE

	Benelli M3 Super 90			12 gauge
	Benelli M4 Super 90			12 gauge

	Ingram MAC-10				.45 ACP
	Heckler & Koch MP5			9x19mm Parabellum
	Heckler & Koch UMP45		.45 ACP
	FN P90						FN 5.7x28mm
	Steyr TMP					9x19mm Parabellum

	FAMAS						5.56x45mm NATO
	IMI Galil					7.62x51mm NATO
	AK-47						7.62x39mm
	M4A1						5.56x45mm NATO

	M249						5.56x45mm NATO
	Steyr AUG					5.56x45mm NATO
	SIG SG552 Commando			7.62×39mm

	Steyr SSG 08				.338 Lapua Magnum
	Arctic Warfare Magnum		.338 Lapua Magnum
	Heckler & Koch G3SG/1		7.62x51mm NATO
	SIG SG550-1					5.56×45mm NATO

	Frag Grenade				Frag Grenade
	Smoke Grenade				Smoke Grenade
	Flashbang					Flashbang
--]]





game.AddAmmoType({
	name = "Test Ammo",
	dmgtype = DMG_BULLET,
	tracer = TRACER_NONE,
	force = 100,
	minsplash = 10,
	maxsplash = 10,
	flags = AMMO_FORCE_DROP_IF_CARRIED,
	plydmg = 0,
	npcdmg = 0,
	maxcarry = 9999
})

game.AddAmmoType({
	name = "Test Ammo Grenade",
	dmgtype = DMG_BULLET,
	tracer = TRACER_NONE,
	force = 100,
	minsplash = 10,
	maxsplash = 10,
	flags = AMMO_FORCE_DROP_IF_CARRIED,
	plydmg = 0,
	npcdmg = 0,
	maxcarry = 9999
})

game.AddAmmoType({
	name = "9x19mm Parabellum",
	dmgtype = DMG_BULLET,
	tracer = TRACER_LINE_AND_WHIZ,
	force = 46,
	minsplash = 10,
	maxsplash = 10,
	flags = AMMO_FORCE_DROP_IF_CARRIED,
	plydmg = 0,
	npcdmg = 0,
	maxcarry = 9999
})

game.AddAmmoType({
	name = "FN 5.7x28mm",
	dmgtype = DMG_BULLET,
	tracer = TRACER_LINE_AND_WHIZ,
	force = 38,
	minsplash = 10,
	maxsplash = 10,
	flags = AMMO_FORCE_DROP_IF_CARRIED,
	plydmg = 0,
	npcdmg = 0,
	maxcarry = 9999
})

game.AddAmmoType({
	name = ".50 AE",
	dmgtype = DMG_BULLET,
	tracer = TRACER_LINE_AND_WHIZ,
	force = 111,
	minsplash = 10,
	maxsplash = 10,
	flags = AMMO_FORCE_DROP_IF_CARRIED,
	plydmg = 0,
	npcdmg = 0,
	maxcarry = 9999
})

game.AddAmmoType({
	name = ".45 ACP",
	dmgtype = DMG_BULLET,
	tracer = TRACER_LINE_AND_WHIZ,
	force = 52,
	minsplash = 10,
	maxsplash = 10,
	flags = AMMO_FORCE_DROP_IF_CARRIED,
	plydmg = 0,
	npcdmg = 0,
	maxcarry = 9999
})

game.AddAmmoType({
	name = "5.56x45mm NATO",
	dmgtype = DMG_BULLET,
	tracer = TRACER_LINE_AND_WHIZ,
	force = 64,
	minsplash = 10,
	maxsplash = 10,
	flags = AMMO_FORCE_DROP_IF_CARRIED,
	plydmg = 0,
	npcdmg = 0,
	maxcarry = 9999
})

game.AddAmmoType({
	name = "7.62x51mm NATO",
	dmgtype = DMG_BULLET,
	tracer = TRACER_LINE_AND_WHIZ,
	force = 78,
	minsplash = 10,
	maxsplash = 10,
	flags = AMMO_FORCE_DROP_IF_CARRIED,
	plydmg = 0,
	npcdmg = 0,
	maxcarry = 9999
})

game.AddAmmoType({
	name = "7.62x39mm",
	dmgtype = DMG_BULLET,
	tracer = TRACER_LINE_AND_WHIZ,
	force = 85,
	minsplash = 10,
	maxsplash = 10,
	flags = AMMO_FORCE_DROP_IF_CARRIED,
	plydmg = 0,
	npcdmg = 0,
	maxcarry = 9999
})

game.AddAmmoType({
	name = ".338 Lapua Magnum",
	dmgtype = DMG_BULLET,
	tracer = TRACER_LINE_AND_WHIZ,
	force = 150,
	minsplash = 10,
	maxsplash = 10,
	flags = AMMO_FORCE_DROP_IF_CARRIED,
	plydmg = 0,
	npcdmg = 0,
	maxcarry = 9999
})

game.AddAmmoType({
	name = "12 gauge",
	dmgtype = DMG_BULLET,
	tracer = TRACER_LINE_AND_WHIZ,
	force = 18,
	minsplash = 10,
	maxsplash = 10,
	flags = AMMO_FORCE_DROP_IF_CARRIED,
	plydmg = 0,
	npcdmg = 0,
	maxcarry = 9999
})

game.AddAmmoType({
	name = "Frag Grenade",
	dmgtype = DMG_BULLET,
	tracer = TRACER_LINE_AND_WHIZ,
	force = 100,
	minsplash = 10,
	maxsplash = 10,
	flags = AMMO_FORCE_DROP_IF_CARRIED,
	plydmg = 0,
	npcdmg = 0,
	maxcarry = 9999
})

game.AddAmmoType({
	name = "Smoke Grenade",
	dmgtype = DMG_BULLET,
	tracer = TRACER_LINE_AND_WHIZ,
	force = 100,
	minsplash = 10,
	maxsplash = 10,
	flags = AMMO_FORCE_DROP_IF_CARRIED,
	plydmg = 0,
	npcdmg = 0,
	maxcarry = 9999
})

game.AddAmmoType({
	name = "Flashbang",
	dmgtype = DMG_BULLET,
	tracer = TRACER_LINE_AND_WHIZ,
	force = 100,
	minsplash = 10,
	maxsplash = 10,
	flags = AMMO_FORCE_DROP_IF_CARRIED,
	plydmg = 0,
	npcdmg = 0,
	maxcarry = 9999
})
