/************************************************************************/
/*
#    An explaination of the naming format for guns and ammo:
#
#    a = Ammo, as in individual rounds of ammunition.
#    b = Box, intended to have ammo taken out one at a time by hand.
#    c = Clips, intended to reload magazines or guns quickly.
#    m = Magazine, intended to hold rounds of ammo.
#    s = Speedloaders, intended to reload guns quickly.
#
#    Use this format, followed by the caliber. For example, a shotgun's caliber
#    variable is "12g" as a result. Ergo, a shotgun round's path would have "a12g",
#    or a magazine with shotgun shells would be "m12g" instead. To avoid confusion
#    for developers and in-game admins spawning these items, stick to this format.
#    Likewise, when creating new rounds, the caliber variable should match whatever
#    the name says.
#
#    This comment is copied in magazines.dm as well.
*/
/************************************************************************/

/obj/item/ammo_casing/c10mm
	desc = "A 10mm bullet casing."
	caliber = "10mm"
	projectile_type = /obj/item/projectile/bullet/p10mm

/obj/item/ammo_casing/c9mm
	desc = "A 9mm bullet casing."
	caliber = "9mm"
	projectile_type = /obj/item/projectile/bullet/p9mm

/obj/item/ammo_casing/c32
	desc = "A .32 bullet casing."
	caliber = ".32"
	projectile_type = /obj/item/projectile/bullet/pl32

/obj/item/ammo_casing/c45
	desc = "A .45 bullet casing."
	caliber = ".45"
	projectile_type = /obj/item/projectile/bullet/p45

/obj/item/ammo_casing/c10x24
	desc = "A 10mm x 24mm caseless bullet."
	caliber = "10x24"
	projectile_type = /obj/item/projectile/bullet/p10x24
	is_caseless = TRUE

/obj/item/ammo_casing/c556
	desc = "A 5.56mm bullet casing."
	caliber = "5.56"
	projectile_type = /obj/item/projectile/bullet/p556

/obj/item/ammo_casing/c65
	desc = "A 6.5mm bullet casing."
	caliber = "6.5mm"
	projectile_type = /obj/item/projectile/bullet/p65


/obj/item/ammo_casing/c762
	desc = "A 7.62mm bullet casing."
	caliber = "7.62"
	projectile_type = /obj/item/projectile/bullet/p762

/obj/item/ammo_casing/c357
	desc = "A .357 bullet casing."
	caliber = ".357"
	projectile_type = /obj/item/projectile/bullet/p357

/obj/item/ammo_casing/c38
	desc = "A .38 bullet casing."
	caliber = ".38"
	projectile_type = /obj/item/projectile/bullet/p38

/obj/item/ammo_casing/c44
	desc = "A .44 bullet casing."
	caliber = ".44"
	projectile_type = /obj/item/projectile/bullet/p44

/obj/item/ammo_casing/c50
	desc = "A .50AE bullet casing."
	caliber = ".50"
	projectile_type = /obj/item/projectile/bullet/p50

/obj/item/ammo_casing/c145
	name = "shell casing"
	desc = "A 14.5mm shell."
	icon_state = "lcasing"
	spent_icon = "lcasing-spent"
	caliber = "14.5mm"
	projectile_type = /obj/item/projectile/bullet/p145
	matter = list(MATERIAL_STEEL = 1)

/obj/item/ammo_casing/c12g/shotgun
	name = "shotgun shell"
	desc = "A 12 gauge slug shotshell."
	icon_state = "slshell"
	caliber = "shotgun"
	projectile_type = /obj/item/projectile/bullet/shotgun
	matter = list(MATERIAL_STEEL = 1)

/obj/item/ammo_casing/c12g/shotgun/beanbag
	name = "beanbag shell"
	desc = "A 12 gauge beanbag shotshell."
	icon_state = "bshell"
	projectile_type = /obj/item/projectile/bullet/shotgun/beanbag
	matter = list(MATERIAL_STEEL = 1)

/obj/item/ammo_casing/c12g/shotgun/pellet
	name = "shotgun shell"
	desc = "A 12 gauge shotshell."
	icon_state = "gshell"
	projectile_type = /obj/item/projectile/bullet/pellet/shotgun
	matter = list(MATERIAL_STEEL = 1)

/obj/item/ammo_casing/c12g/shotgun/blank
	name = "shotgun shell"
	desc = "A 12 gauge blank shotshell."
	icon_state = "blshell"
	projectile_type = /obj/item/projectile/bullet/blank
	matter = list(MATERIAL_STEEL = 1)

/obj/item/ammo_casing/c12g/shotgun/practice
	name = "shotgun shell"
	desc = "A 12 gauge practice shotshell."
	icon_state = "pshell"
	projectile_type = /obj/item/projectile/bullet/shotgun/practice
	matter = list(MATERIAL_STEEL = 1)

//Can stun in one hit if aimed at the head, but
//is blocked by clothing that stops tasers and is vulnerable to EMP
/obj/item/ammo_casing/c12g/shotgun/stunshell
	name = "taser shell"
	desc = "A 12 gauge taser shotshell."
	icon_state = "stunshell"
	spent_icon = "stunshell-spent"
	projectile_type = /obj/item/projectile/energy/electrode/stunshot
	matter = list(MATERIAL_STEEL = 1, MATERIAL_SILVER = 0.5)

/obj/item/ammo_casing/c12g/shotgun/stunshell/emp_act(severity)
	if(prob(100/severity)) BB = null
	update_icon()

//Does not stun, only blinds, but has area of effect.
/obj/item/ammo_casing/c12g/shotgun/flash
	name = "flash shell"
	desc = "A chemical filled shotshell used to signal distress or provide illumination."
	icon_state = "fshell"
	projectile_type = /obj/item/projectile/energy/flash/flare
	matter = list(MATERIAL_STEEL = 1, MATERIAL_SILVER = 0.5)

/obj/item/ammo_casing/rocket
	name = "PG-7VL grenade"
	desc = "A high explosive warhead designed to be fired from a launcher."
	icon_state = "rocketshell"
	projectile_type = /obj/item/missile
	caliber = "rocket"
	maxamount = 1
	is_caseless = TRUE
	w_class = ITEM_SIZE_NORMAL

/obj/item/ammo_casing/a75
	desc = "A 20mm bullet casing."
	caliber = ".75"
	projectile_type = /obj/item/projectile/bullet/gyro

/obj/item/ammo_casing/cap
	name = "cap"
	desc = "A cap for children toys."
	caliber = "caps"
	color = "#FF0000"
	projectile_type = /obj/item/projectile/bullet/cap

/obj/item/ammo_casing/spent // For simple hostile mobs only, so they don't cough up usable bullets when firing. This is for literally nothing else.
	icon_state = "s-casing-spent"
	BB = null
	projectile_type = null