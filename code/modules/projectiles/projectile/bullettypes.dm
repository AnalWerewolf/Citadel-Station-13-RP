//Damage multipliers
#define HIGH_VELOCITY_MULTIPLIER 1.2 //Determines the damage, agony, & armor_penetration values from base damage & armor_penetration.
#define HOLLOW_POINT_DAMAGE_MULTIPLIER 1.5 //Determines the damage value from base damage.
#define HOLLOW_POINT_PENETRATION -50 //Determines the armor_penetration value from base armor_penetration. NOT MULTIPLICATIVE
#define RUBBER_DAMAGE_MULTIPLIER 0.15 //Determines the damage value from base damage.
#define RUBBER_AGONY_MULTIPLIER 0.85 //Determines the agony value from base damage.
#define RUBBER_PENETRATION_MULTIPLIER 0 //Determines the armor_penetration value from base armor_penetration.
#define PRACTICE_DAMAGE_MULTIPLIER 0 //Determines the damage value from base damage.
#define PRACTICE_AGONY_MULTIPLIER 0.1 //Determines the agony value from base damage.
#define PRACTICE_PENETRATION_MULTIPLIER 0.2 //Determines the armor_penetration value from base armor_penetration.

//Step delays //Default value is 1. Lower value makes bullet go faster, higher value makes bullet go slower.
#define HIGH_VELOCITY_STEP_DELAY 0.75

//Low-caliber pistols and SMGs
#define ARMOR_PENETRATION_LOW_CALIBER_PISTOL 10
#define DAMAGE_10MM 24
#define DAMAGE_9MM 22
#define DAMAGE_32 20
#define DAMAGE_45 26

//Carbines and rifles
#define DAMAGE_10X24 30
#define ARMOR_PENETRATION_10X24 10
#define DAMAGE_556 25
#define ARMOR_PENETRATION_556 25
#define DAMAGE_65 30
#define ARMOR_PENETRATION_65 20
#define DAMAGE_762 40
#define ARMOR_PENETRATION_762 30

//Revolvers and high-caliber pistols
#define ARMOR_PENETRATION_REVOLVER 12
#define DAMAGE_357 40
#define DAMAGE_38 35
#define ARMOR_PENETRATION_HIGH_CALIBER_PISTOL 10
#define DAMAGE_44 45
#define DAMAGE_50 50

//Sniper rifles
#define ARMOR_PENETRATION_SNIPER 80
#define DAMAGE_145 80
#define DAMAGE_50BMG 70

//Shotguns
#define DAMAGE_SLUG 50
#define ARMOR_PENETRATION_SLUG 12
#define DAMAGE_BEANBAG 10
#define AGONY_BEANBAG 60
#define ARMOR_PENETRATION_BEANBAG 0
#define DAMAGE_PELLET 12
#define PELLET_COUNT 6

//Low-caliber pistols and SMGs
/obj/item/projectile/bullet/p9mm
	damage = DAMAGE_9MM
	armor_penetration = ARMOR_PENETRATION_LOW_CALIBER_PISTOL
	can_ricochet = TRUE

/obj/item/projectile/bullet/p9mm/hv
	damage = DAMAGE_9MM * HIGH_VELOCITY_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_LOW_CALIBER_PISTOL * HIGH_VELOCITY_MULTIPLIER
	penetrating = 1
	step_delay = HIGH_VELOCITY_STEP_DELAY

/obj/item/projectile/bullet/p9mm/hp
	damage = DAMAGE_9MM * HOLLOW_POINT_DAMAGE_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_LOW_CALIBER_PISTOL + HOLLOW_POINT_PENETRATION
	can_ricochet = TRUE

/obj/item/projectile/bullet/p9mm/rubber
	name = "rubber bullet"
	damage = DAMAGE_9MM * RUBBER_DAMAGE_MULTIPLIER
	agony = DAMAGE_9MM * RUBBER_AGONY_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_LOW_CALIBER_PISTOL * RUBBER_PENETRATION_MULTIPLIER
	embed = FALSE
	sharp = FALSE

/obj/item/projectile/bullet/p9mm/practice
	name = "practice bullet"
	damage = DAMAGE_9MM * PRACTICE_DAMAGE_MULTIPLIER
	agony = DAMAGE_9MM * PRACTICE_AGONY_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_LOW_CALIBER_PISTOL * PRACTICE_PENETRATION_MULTIPLIER
	embed = FALSE
	sharp = FALSE
	can_ricochet = FALSE

/obj/item/projectile/bullet/p10mm
	damage = DAMAGE_10MM
	armor_penetration = ARMOR_PENETRATION_LOW_CALIBER_PISTOL
	can_ricochet = TRUE

/obj/item/projectile/bullet/p10mm/hp
	damage = DAMAGE_10MM * HOLLOW_POINT_DAMAGE_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_LOW_CALIBER_PISTOL + HOLLOW_POINT_PENETRATION
	can_ricochet = TRUE

/obj/item/projectile/bullet/p10mm/rubber
	name = "rubber bullet"
	damage = DAMAGE_10MM * RUBBER_DAMAGE_MULTIPLIER
	agony = DAMAGE_10MM * RUBBER_AGONY_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_LOW_CALIBER_PISTOL * RUBBER_PENETRATION_MULTIPLIER
	embed = FALSE
	sharp = FALSE

/obj/item/projectile/bullet/p10mm/hv
	damage = DAMAGE_10MM * HIGH_VELOCITY_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_LOW_CALIBER_PISTOL * HIGH_VELOCITY_MULTIPLIER
	penetrating = 1
	step_delay = HIGH_VELOCITY_STEP_DELAY

/obj/item/projectile/bullet/p32
	damage = DAMAGE_32
	armor_penetration = ARMOR_PENETRATION_LOW_CALIBER_PISTOL
	can_ricochet = TRUE

/obj/item/projectile/bullet/p32/hp
	damage = DAMAGE_32 * HOLLOW_POINT_DAMAGE_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_LOW_CALIBER_PISTOL + HOLLOW_POINT_PENETRATION
	can_ricochet = TRUE

/obj/item/projectile/bullet/p32/rubber
	name = "rubber bullet"
	damage = DAMAGE_32 * RUBBER_DAMAGE_MULTIPLIER
	agony = DAMAGE_32 * RUBBER_AGONY_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_LOW_CALIBER_PISTOL * RUBBER_PENETRATION_MULTIPLIER
	embed = FALSE
	sharp = FALSE

/obj/item/projectile/bullet/p45
	damage = DAMAGE_45
	armor_penetration = ARMOR_PENETRATION_LOW_CALIBER_PISTOL
	can_ricochet = TRUE

/obj/item/projectile/bullet/p45/hv
	damage = DAMAGE_45 * HIGH_VELOCITY_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_LOW_CALIBER_PISTOL * HIGH_VELOCITY_MULTIPLIER
	penetrating = 1
	step_delay = HIGH_VELOCITY_STEP_DELAY

/obj/item/projectile/bullet/p45/hp
	damage = DAMAGE_45 * HOLLOW_POINT_DAMAGE_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_LOW_CALIBER_PISTOL + HOLLOW_POINT_PENETRATION
	can_ricochet = TRUE

/obj/item/projectile/bullet/p45/practice
	name = "practice bullet"
	damage = DAMAGE_45 * PRACTICE_DAMAGE_MULTIPLIER
	agony = DAMAGE_45 * PRACTICE_AGONY_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_LOW_CALIBER_PISTOL * PRACTICE_PENETRATION_MULTIPLIER
	embed = FALSE
	sharp = FALSE
	can_ricochet = FALSE

/obj/item/projectile/bullet/p45/rubber
	name = "rubber bullet"
	damage = DAMAGE_45 * RUBBER_DAMAGE_MULTIPLIER
	agony = DAMAGE_45 * RUBBER_AGONY_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_LOW_CALIBER_PISTOL * RUBBER_PENETRATION_MULTIPLIER
	embed = FALSE
	sharp = FALSE

//Carbines and rifles
/obj/item/projectile/bullet/p10x24
	damage = DAMAGE_10X24
	armor_penetration = ARMOR_PENETRATION_10X24
	penetrating = 1
	sharp = FALSE
	can_ricochet = TRUE

/obj/item/projectile/bullet/p10x24/hv
	damage = DAMAGE_10X24 * HIGH_VELOCITY_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_10X24 * HIGH_VELOCITY_MULTIPLIER
	penetrating = 2
	step_delay = HIGH_VELOCITY_STEP_DELAY

/obj/item/projectile/bullet/p10x24/hp
	damage = DAMAGE_10X24 * HOLLOW_POINT_DAMAGE_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_10X24 + HOLLOW_POINT_PENETRATION
	penetrating = 0

/obj/item/projectile/bullet/p10x24/rubber
	name = "rubber bullet"
	damage = DAMAGE_10X24 * RUBBER_DAMAGE_MULTIPLIER
	agony = DAMAGE_10X24 * RUBBER_AGONY_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_10X24 * RUBBER_PENETRATION_MULTIPLIER
	embed = FALSE
	sharp = FALSE

/obj/item/projectile/bullet/p10x24/practice
	name = "practice bullet"
	damage = DAMAGE_10X24 * PRACTICE_DAMAGE_MULTIPLIER
	agony = DAMAGE_10X24 * PRACTICE_AGONY_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_10X24 * PRACTICE_PENETRATION_MULTIPLIER
	embed = FALSE
	sharp = FALSE
	can_ricochet = FALSE

/obj/item/projectile/bullet/p556
	damage = DAMAGE_556
	armor_penetration = ARMOR_PENETRATION_556
	penetrating = 2
	can_ricochet = TRUE

/obj/item/projectile/bullet/p556/hv
	damage = DAMAGE_556 * HIGH_VELOCITY_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_556 * HIGH_VELOCITY_MULTIPLIER
	step_delay = HIGH_VELOCITY_STEP_DELAY

/obj/item/projectile/bullet/p556/hp
	damage = DAMAGE_556 * HOLLOW_POINT_DAMAGE_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_556 + HOLLOW_POINT_PENETRATION
	penetrating = 0

/obj/item/projectile/bullet/p556/rubber
	name = "rubber bullet"
	damage = DAMAGE_556 * RUBBER_DAMAGE_MULTIPLIER
	agony = DAMAGE_556 * RUBBER_AGONY_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_556 * RUBBER_PENETRATION_MULTIPLIER
	embed = FALSE
	sharp = FALSE

/obj/item/projectile/bullet/p556/practice
	name = "practice bullet"
	damage = DAMAGE_556 * PRACTICE_DAMAGE_MULTIPLIER
	agony = DAMAGE_556 * PRACTICE_AGONY_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_556 * PRACTICE_PENETRATION_MULTIPLIER
	embed = FALSE
	sharp = FALSE
	can_ricochet = FALSE

/obj/item/projectile/bullet/p65
	damage = DAMAGE_65
	armor_penetration = ARMOR_PENETRATION_65
	penetrating = 1
	sharp = FALSE
	can_ricochet = TRUE

/obj/item/projectile/bullet/p65/hv
	damage = DAMAGE_65 * HIGH_VELOCITY_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_65 * HIGH_VELOCITY_MULTIPLIER
	step_delay = HIGH_VELOCITY_STEP_DELAY

/obj/item/projectile/bullet/p65/hp
	damage = DAMAGE_65 * HOLLOW_POINT_DAMAGE_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_65 + HOLLOW_POINT_PENETRATION
	penetrating = 0

/obj/item/projectile/bullet/p65/rubber
	name = "rubber bullet"
	damage = DAMAGE_65 * RUBBER_DAMAGE_MULTIPLIER
	agony = DAMAGE_65 * RUBBER_AGONY_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_65 * RUBBER_PENETRATION_MULTIPLIER
	embed = FALSE
	sharp = FALSE

/obj/item/projectile/bullet/p65/practice
	name = "practice bullet"
	damage = DAMAGE_65 * PRACTICE_DAMAGE_MULTIPLIER
	agony = DAMAGE_65 * PRACTICE_AGONY_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_65 * PRACTICE_PENETRATION_MULTIPLIER
	embed = FALSE
	sharp = FALSE
	can_ricochet = FALSE

/obj/item/projectile/bullet/p762
	damage = DAMAGE_762
	armor_penetration = ARMOR_PENETRATION_762
	penetrating = 1
	can_ricochet = TRUE

/obj/item/projectile/bullet/p762/hv
	damage = DAMAGE_762 * HIGH_VELOCITY_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_762 * HIGH_VELOCITY_MULTIPLIER
	penetrating = 2
	step_delay = HIGH_VELOCITY_STEP_DELAY

/obj/item/projectile/bullet/p762/hp
	damage = DAMAGE_762 * HOLLOW_POINT_DAMAGE_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_762 + HOLLOW_POINT_PENETRATION
	penetrating = 0

/obj/item/projectile/bullet/p762/rubber
	name = "rubber bullet"
	damage = DAMAGE_762 * RUBBER_DAMAGE_MULTIPLIER
	agony = DAMAGE_762 * RUBBER_AGONY_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_762 * RUBBER_PENETRATION_MULTIPLIER
	embed = FALSE
	sharp = FALSE

/obj/item/projectile/bullet/p762/practice
	name = "practice bullet"
	damage = DAMAGE_762 * PRACTICE_DAMAGE_MULTIPLIER
	agony = DAMAGE_762 * PRACTICE_AGONY_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_762 * PRACTICE_PENETRATION_MULTIPLIER
	embed = FALSE
	sharp = FALSE
	can_ricochet = FALSE

//Revolvers and high-caliber pistols

/obj/item/projectile/bullet/p357
	damage = DAMAGE_357
	armor_penetration = ARMOR_PENETRATION_REVOLVER
	can_ricochet = TRUE

/obj/item/projectile/bullet/p357/hv
	damage = DAMAGE_357 * HIGH_VELOCITY_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_REVOLVER * HIGH_VELOCITY_MULTIPLIER
	penetrating = 1
	step_delay = HIGH_VELOCITY_STEP_DELAY

/obj/item/projectile/bullet/p357/hp
	damage = DAMAGE_357 * HOLLOW_POINT_DAMAGE_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_REVOLVER + HOLLOW_POINT_PENETRATION
	can_ricochet = TRUE

/obj/item/projectile/bullet/p357/rubber
	name = "rubber bullet"
	damage = DAMAGE_357 * RUBBER_DAMAGE_MULTIPLIER
	agony = DAMAGE_357 * RUBBER_AGONY_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_REVOLVER * RUBBER_PENETRATION_MULTIPLIER
	embed = FALSE
	sharp = FALSE

/obj/item/projectile/bullet/p357/practice
	name = "practice bullet"
	damage = DAMAGE_357 * PRACTICE_DAMAGE_MULTIPLIER
	agony = DAMAGE_357 * PRACTICE_AGONY_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_REVOLVER * PRACTICE_PENETRATION_MULTIPLIER
	embed = FALSE
	sharp = FALSE
	can_ricochet = FALSE

/obj/item/projectile/bullet/p38
	damage = DAMAGE_38
	armor_penetration = ARMOR_PENETRATION_REVOLVER
	can_ricochet = TRUE

/obj/item/projectile/bullet/p38/hv
	damage = DAMAGE_38 * HIGH_VELOCITY_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_REVOLVER * HIGH_VELOCITY_MULTIPLIER
	penetrating = 1
	step_delay = HIGH_VELOCITY_STEP_DELAY

/obj/item/projectile/bullet/p38/hp
	damage = DAMAGE_38 * HOLLOW_POINT_DAMAGE_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_REVOLVER + HOLLOW_POINT_PENETRATION
	can_ricochet = TRUE

/obj/item/projectile/bullet/p38/rubber
	name = "rubber bullet"
	damage = DAMAGE_38 * RUBBER_DAMAGE_MULTIPLIER
	agony = DAMAGE_38 * RUBBER_AGONY_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_REVOLVER * RUBBER_PENETRATION_MULTIPLIER
	embed = FALSE
	sharp = FALSE

/obj/item/projectile/bullet/p38/practice
	name = "practice bullet"
	damage = DAMAGE_38 * PRACTICE_DAMAGE_MULTIPLIER
	agony = DAMAGE_38 * PRACTICE_AGONY_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_REVOLVER * PRACTICE_PENETRATION_MULTIPLIER
	embed = FALSE
	sharp = FALSE
	can_ricochet = FALSE

/obj/item/projectile/bullet/p44
	damage = DAMAGE_44
	armor_penetration = ARMOR_PENETRATION_HIGH_CALIBER_PISTOL
	can_ricochet = TRUE

/obj/item/projectile/bullet/p44/hv
	damage = DAMAGE_44 * HIGH_VELOCITY_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_REVOLVER * HIGH_VELOCITY_MULTIPLIER
	penetrating = 1
	step_delay = HIGH_VELOCITY_STEP_DELAY

/obj/item/projectile/bullet/p44/hp
	damage = DAMAGE_44 * HOLLOW_POINT_DAMAGE_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_REVOLVER + HOLLOW_POINT_PENETRATION
	can_ricochet = TRUE

/obj/item/projectile/bullet/p44/rubber
	name = "rubber bullet"
	damage = DAMAGE_44 * RUBBER_DAMAGE_MULTIPLIER
	agony = DAMAGE_44 * RUBBER_AGONY_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_REVOLVER * RUBBER_PENETRATION_MULTIPLIER
	embed = FALSE
	sharp = FALSE

/obj/item/projectile/bullet/p44/practice
	name = "practice bullet"
	damage = DAMAGE_44 * PRACTICE_DAMAGE_MULTIPLIER
	agony = DAMAGE_44 * PRACTICE_AGONY_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_REVOLVER * PRACTICE_PENETRATION_MULTIPLIER
	embed = FALSE
	sharp = FALSE
	can_ricochet = FALSE

/obj/item/projectile/bullet/p50
	damage = DAMAGE_50
	armor_penetration = ARMOR_PENETRATION_HIGH_CALIBER_PISTOL * RUBBER_PENETRATION_MULTIPLIER
	can_ricochet = TRUE

/obj/item/projectile/bullet/p50/hv
	damage = DAMAGE_50 * HIGH_VELOCITY_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_REVOLVER * HIGH_VELOCITY_MULTIPLIER
	penetrating = 1
	step_delay = HIGH_VELOCITY_STEP_DELAY

/obj/item/projectile/bullet/p50/hp
	damage = DAMAGE_50 * HOLLOW_POINT_DAMAGE_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_REVOLVER + HOLLOW_POINT_PENETRATION
	can_ricochet = TRUE

/obj/item/projectile/bullet/p50/rubber
	name = "rubber bullet"
	damage = DAMAGE_50 * RUBBER_DAMAGE_MULTIPLIER
	agony = DAMAGE_50 * RUBBER_AGONY_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_REVOLVER * RUBBER_PENETRATION_MULTIPLIER
	embed = FALSE
	sharp = FALSE

/obj/item/projectile/bullet/p50/practice
	name = "practice bullet"
	damage = DAMAGE_50 * PRACTICE_DAMAGE_MULTIPLIER
	agony = DAMAGE_50 * PRACTICE_AGONY_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_REVOLVER * PRACTICE_PENETRATION_MULTIPLIER
	embed = FALSE
	sharp = FALSE
	can_ricochet = FALSE

//Sniper rifles
/obj/item/projectile/bullet/p145
	damage = DAMAGE_145
	armor_penetration = ARMOR_PENETRATION_SNIPER
	stun = 3
	weaken = 3
	penetrating = 5
	hitscan = TRUE //so the PTR isn't useless as a sniper weapon

/obj/item/projectile/bullet/p145/hv // Hahah holy shit
	damage = DAMAGE_145 * HIGH_VELOCITY_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_SNIPER * HIGH_VELOCITY_MULTIPLIER

/obj/item/projectile/bullet/p50bmg
	damage = DAMAGE_50BMG
	armor_penetration = ARMOR_PENETRATION_SNIPER
	stun = 3
	weaken = 3
	penetrating = 5
	hitscan = TRUE

/obj/item/projectile/bullet/p50bmg/hv
	damage = DAMAGE_50BMG * HIGH_VELOCITY_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_SNIPER * HIGH_VELOCITY_MULTIPLIER

//Shotguns
/obj/item/projectile/bullet/shotgun
	name = "slug"
	icon_state = "slug"
	damage = DAMAGE_SLUG
	armor_penetration = ARMOR_PENETRATION_SLUG

/obj/item/projectile/bullet/shotgun/beanbag
	name = "beanbag"
	icon_state = "beanbag"
	check_armour = "melee"
	damage = DAMAGE_BEANBAG
	agony = AGONY_BEANBAG
	armor_penetration = ARMOR_PENETRATION_BEANBAG
	embed = FALSE
	sharp = FALSE

/obj/item/projectile/bullet/shotgun/practice
	name = "practice slug"
	damage = DAMAGE_SLUG * PRACTICE_DAMAGE_MULTIPLIER
	agony = DAMAGE_SLUG * PRACTICE_AGONY_MULTIPLIER
	armor_penetration = ARMOR_PENETRATION_SLUG * PRACTICE_PENETRATION_MULTIPLIER
	embed = FALSE

//Should do about 80 damage at 1 tile distance (adjacent), and 50 damage at 3 tiles distance.
//Overall less damage than slugs in exchange for more damage at very close range and more embedding
/obj/item/projectile/bullet/pellet/shotgun
	name = "pellet"
	icon_state = "buckshot"
	damage = DAMAGE_PELLET
	pellets = PELLET_COUNT
	range_step = 1
	spread_step = 10

/obj/item/projectile/bullet/shotgun/ion
	name = "ion slug"
	damage = 15
	embed_chance = 0
	sharp = 0
	check_armour = "melee"
	combustion = FALSE

/obj/item/projectile/energy/flash/shotgun
	name = "chemical slug"
	damage = 10
	kill_count = 15 //if the shell hasn't hit anything after travelling this far it just explodes.
	flash_strength = 15
	brightness = 15

/obj/item/projectile/energy/electrode/shotgun
	name = "stun slug"
	icon_state = "bullet"
	damage = 10
	taser_effect = 1
	agony = 100

/obj/item/projectile/bullet/shotgun/ion/on_hit(var/atom/target, var/blocked = 0)
	..()
	empulse(target, 0, 0, 0, 0)	//Only affects what it hits
	return 1

//Miscellaneous
/obj/item/projectile/bullet/blank
	invisibility = 101
	damage_type = HALLOSS
	nodamage = TRUE
	damage = 0
	embed = FALSE
	sharp = FALSE

/obj/item/projectile/bullet/cap
	name = "cap"
	damage_type = HALLOSS
	nodamage = TRUE
	damage = 0
	embed = FALSE
	sharp = FALSE

/*
Miscellaneous stuff from the old Citadel bullets.dm file that are either no longer used, or never were implemented.

/obj/item/projectile/bullet/incendiary
	name = "incendiary bullet"
	icon_state = "bullet_alt"
	damage = 15
	damage_type = BURN
	incendiary = 1
	flammability = 2

/obj/item/projectile/bullet/incendiary/flamethrower
	name = "ball of fire"
	desc = "Don't stand in the fire."
	icon_state = "fireball"
	damage = 10
	embed_chance = 0
	incendiary = 2
	flammability = 4
	agony = 30
	kill_count = 4
	vacuum_traversal = 0

/obj/item/projectile/bullet/incendiary/flamethrower/large
	damage = 15
	kill_count = 6

/obj/item/projectile/bullet/suffocationbullet
	name = "co bullet"
	damage = 20
	damage_type = OXY

/obj/item/projectile/bullet/cyanideround
	name = "poison bullet"
	damage = 40
	damage_type = TOX

/obj/item/projectile/bullet/burstbullet
	name = "exploding bullet"
	fire_sound = 'sound/effects/Explosion1.ogg'
	damage = 20
	embed_chance = 0
	edge = 1

/obj/item/projectile/bullet/burstbullet/on_hit(var/atom/target, var/blocked = 0)
	if(isturf(target))
		explosion(target, -1, 0, 2)
*/

#undef HIGH_VELOCITY_MULTIPLIER
#undef RUBBER_DAMAGE_MULTIPLIER
#undef RUBBER_AGONY_MULTIPLIER
#undef RUBBER_PENETRATION_MULTIPLIER
#undef PRACTICE_DAMAGE_MULTIPLIER
#undef PRACTICE_AGONY_MULTIPLIER
#undef PRACTICE_PENETRATION_MULTIPLIER
#undef HIGH_VELOCITY_STEP_DELAY
#undef ARMOR_PENETRATION_LOW_CALIBER_PISTOL
#undef DAMAGE_10MM
#undef DAMAGE_9MM
#undef DAMAGE_32
#undef DAMAGE_45
#undef DAMAGE_10X24
#undef ARMOR_PENETRATION_10X24
#undef DAMAGE_556
#undef ARMOR_PENETRATION_556
#undef DAMAGE_65
#undef ARMOR_PENETRATION_65
#undef DAMAGE_762
#undef ARMOR_PENETRATION_762
#undef ARMOR_PENETRATION_REVOLVER
#undef DAMAGE_357
#undef DAMAGE_38
#undef ARMOR_PENETRATION_HIGH_CALIBER_PISTOL
#undef DAMAGE_44
#undef DAMAGE_50
#undef ARMOR_PENETRATION_SNIPER
#undef DAMAGE_145
#undef DAMAGE_50BMG
#undef DAMAGE_SLUG
#undef ARMOR_PENETRATION_SLUG
#undef DAMAGE_BEANBAG
#undef AGONY_BEANBAG
#undef ARMOR_PENETRATION_BEANBAG
#undef DAMAGE_PELLET
#undef PELLET_COUNT
