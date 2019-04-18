//
//	This file overrides settings on upstream simple animals to turn on vore behavior
//

/*
## For anything that previously inhertited from: /mob/living/simple_animal/hostile/vore ##

  	vore_active = 1
  	icon = 'icons/mob/vore.dmi'

## For anything that previously inhertied from: /mob/living/simple_animal/hostile/vore/large ##

	vore_active = 1
	icon = 'icons/mob/vore64x64.dmi'
	old_x = -16
	old_y = -16
	pixel_x = -16
	pixel_y = -16
	vore_pounce_chance = 50
*/

//
// Okay! Here we go!
//

<<<<<<< HEAD
/mob/living/simple_animal/hostile/alien
=======
/mob/living/simple_mob/animal/space/alien
>>>>>>> 17eadd4... Merge pull request #5069 from Sebbe9123/mobpathfix
	vore_active = 1
	icon = 'icons/mob/vore.dmi'
	icon_state = "xenohunter"
	icon_living = "xenohunter"
	icon_dead = "xenohunter-dead"
	icon_gib = "gibbed-a"
	vore_icons = SA_ICON_LIVING

<<<<<<< HEAD
/mob/living/simple_animal/hostile/alien/drone
=======
/mob/living/simple_mob/animal/space/alien/drone
>>>>>>> 17eadd4... Merge pull request #5069 from Sebbe9123/mobpathfix
	vore_active = 1
	icon = 'icons/mob/vore.dmi'
	icon_state = "xenodrone"
	icon_living = "xenodrone"
	icon_dead = "xenodrone-dead"
	icon_gib = "gibbed-a"
	vore_icons = SA_ICON_LIVING

<<<<<<< HEAD
/mob/living/simple_animal/hostile/alien/sentinel
=======
/mob/living/simple_mob/animal/space/alien/sentinel
>>>>>>> 17eadd4... Merge pull request #5069 from Sebbe9123/mobpathfix
	vore_active = 1
	icon = 'icons/mob/vore.dmi'
	icon_state = "xenosentinel"
	icon_living = "xenosentinel"
	icon_dead = "xenosentinel-dead"
	icon_gib = "gibbed-a"
	vore_icons = SA_ICON_LIVING

<<<<<<< HEAD
/mob/living/simple_animal/hostile/alien/queen
=======
/mob/living/simple_mob/animal/space/alien/queen
>>>>>>> 17eadd4... Merge pull request #5069 from Sebbe9123/mobpathfix
	vore_active = 1
	icon = 'icons/mob/vore.dmi'
	icon_state = "xenoqueen"
	icon_living = "xenoqueen"
	icon_dead = "xenoqueen-dead"
	icon_gib = "gibbed-a"
	vore_icons = SA_ICON_LIVING

<<<<<<< HEAD
/mob/living/simple_animal/hostile/alien/queen/empress
=======
/mob/living/simple_mob/animal/space/alien/queen/empress
>>>>>>> 17eadd4... Merge pull request #5069 from Sebbe9123/mobpathfix
	vore_active = 1
	icon = 'icons/mob/vore64x64.dmi'
	icon_state = "queen_s"
	icon_living = "queen_s"
	icon_dead = "queen_dead"
	vore_icons = SA_ICON_LIVING | SA_ICON_REST
	old_x = -16
	old_y = 0
	default_pixel_x = -16
	pixel_x = -16
	pixel_y = 0

	vore_capacity = 3
	vore_pounce_chance = 75

<<<<<<< HEAD
/mob/living/simple_animal/hostile/alien/sentinel/praetorian
	icon = 'icons/mob/vore64x64.dmi'
	vore_icons = SA_ICON_LIVING | SA_ICON_REST

/mob/living/simple_animal/hostile/alien/queen/empress/mother
	vore_icons = 0 // NO VORE SPRITES

/mob/living/simple_animal/hostile/bear
=======
/mob/living/simple_mob/animal/space/alien/sentinel/praetorian
	icon = 'icons/mob/vore64x64.dmi'
	vore_icons = SA_ICON_LIVING | SA_ICON_REST

/mob/living/simple_mob/animal/space/alien/queen/empress/mother
	vore_icons = 0 // NO VORE SPRITES

/mob/living/simple_mob/animal/space/bear
>>>>>>> 17eadd4... Merge pull request #5069 from Sebbe9123/mobpathfix
	vore_active = 1
	icon = 'icons/mob/vore.dmi'
	icon_state = "spacebear"
	icon_living = "spacebear"
	icon_dead = "spacebear-dead"
	icon_gib = "bear-gib"
	vore_icons = SA_ICON_LIVING

<<<<<<< HEAD
/mob/living/simple_animal/hostile/bear/hudson
	name = "Hudson"

/mob/living/simple_animal/hostile/bear/brown
=======
/mob/living/simple_mob/animal/space/bear/hudson
	name = "Hudson"

/mob/living/simple_mob/animal/space/bear/brown
>>>>>>> 17eadd4... Merge pull request #5069 from Sebbe9123/mobpathfix
	vore_active = 1
	icon = 'icons/mob/vore.dmi'
	name = "brown bear"
	icon_state = "brownbear"
	icon_living = "brownbear"
	icon_dead = "brownbear-dead"
	icon_gib = "bear-gib"
	vore_icons = SA_ICON_LIVING

<<<<<<< HEAD
/mob/living/simple_animal/hostile/carp
=======
/mob/living/simple_mob/animal/space/carp
>>>>>>> 17eadd4... Merge pull request #5069 from Sebbe9123/mobpathfix
	icon = 'icons/mob/vore.dmi'
	vore_active = 1
	vore_icons = SA_ICON_LIVING

/mob/living/simple_animal/hostile/creature/vore
	vore_active = 1
	// NO VORE SPRITES
	vore_capacity = 0
	vore_pounce_chance = 0	// Only pounces if you're crit.
	vore_escape_chance = 0	// As such, if you're a dibshit who feeds yourself to it, you're staying down.
	// Overrides to non-vore version
	speed = 4			// Slow it down a bit
	health = 80			// Increase health to compensate
	maxHealth = 80

/mob/living/simple_animal/hostile/mimic
	vore_active = 1
	// NO VORE SPRITES
	vore_capacity = 0
	vore_pounce_chance = 33
	// Overrides to non-vore version
	maxHealth = 60
	health = 60

<<<<<<< HEAD
/mob/living/simple_animal/cat
=======
/mob/living/simple_mob/animal/passive/cat
>>>>>>> 17eadd4... Merge pull request #5069 from Sebbe9123/mobpathfix
	vore_active = 1
	// NO VORE SPRITES
	specific_targets = 0 // Targeting UNLOCKED
	vore_max_size = RESIZE_TINY

<<<<<<< HEAD
/mob/living/simple_animal/cat/PunchTarget()
	if(istype(target_mob,/mob/living/simple_animal/mouse))
=======
/mob/living/simple_mob/animal/passive/cat/PunchTarget()
	if(istype(target_mob,/mob/living/simple_mob/animal/passive/mouse))
>>>>>>> 17eadd4... Merge pull request #5069 from Sebbe9123/mobpathfix
		visible_message("<span class='warning'>\The [src] pounces on \the [target_mob]!]</span>")
		target_mob.Stun(5)
		return EatTarget()
	else ..()

<<<<<<< HEAD
/mob/living/simple_animal/cat/Found(var/atom/found_atom)
	if(!SA_attackable(found_atom))
		return null
	if(istype(found_atom,/mob/living/simple_animal/mouse))
=======
/mob/living/simple_mob/animal/passive/cat/Found(var/atom/found_atom)
	if(!SA_attackable(found_atom))
		return null
	if(istype(found_atom,/mob/living/simple_mob/animal/passive/mouse))
>>>>>>> 17eadd4... Merge pull request #5069 from Sebbe9123/mobpathfix
		return found_atom
	if(found_atom in friends)
		return null
	if(will_eat(found_atom))
		return found_atom

<<<<<<< HEAD
/mob/living/simple_animal/cat/fluff/Found(var/atom/found_atom)
=======
/mob/living/simple_mob/animal/passive/cat/fluff/Found(var/atom/found_atom)
>>>>>>> 17eadd4... Merge pull request #5069 from Sebbe9123/mobpathfix
	if (friend == found_atom)
		return null
	return ..()

<<<<<<< HEAD
/mob/living/simple_animal/cat/fluff
=======
/mob/living/simple_mob/animal/passive/cat/fluff
>>>>>>> 17eadd4... Merge pull request #5069 from Sebbe9123/mobpathfix
	vore_ignores_undigestable = 0
	vore_pounce_chance = 100
	vore_digest_chance = 0 // just use the toggle
	vore_default_mode = DM_HOLD //can use the toggle if you wanna be catfood
	vore_standing_too = TRUE //gonna get pounced

<<<<<<< HEAD
/mob/living/simple_animal/cat/fluff/EatTarget()
=======
/mob/living/simple_mob/animal/passive/cat/fluff/EatTarget()
>>>>>>> 17eadd4... Merge pull request #5069 from Sebbe9123/mobpathfix
	var/mob/living/TM = target_mob
	prey_excludes += TM //so they won't immediately re-eat someone who struggles out (or gets newspapered out) as soon as they're ate
	spawn(3600) // but if they hang around and get comfortable, they might get ate again
		if(src && TM)
			prey_excludes -= TM
	..() // will_eat check is carried out before EatTarget is called, so prey on the prey_excludes list isn't a problem.

/mob/living/simple_animal/fox
	vore_active = 1
	// NO VORE SPRITES
	vore_max_size = RESIZE_TINY

<<<<<<< HEAD
/mob/living/simple_animal/fox/PunchTarget()
	if(istype(target_mob,/mob/living/simple_animal/mouse))
=======
/mob/living/simple_mob/fox/PunchTarget()
	if(istype(target_mob,/mob/living/simple_mob/animal/passive/mouse))
>>>>>>> 17eadd4... Merge pull request #5069 from Sebbe9123/mobpathfix
		return EatTarget()
	else ..()

/mob/living/simple_animal/fox/Found(var/atom/found_atom)
	if(!SA_attackable(found_atom))
		return null
<<<<<<< HEAD
	if(istype(found_atom,/mob/living/simple_animal/mouse))
=======
	if(istype(found_atom,/mob/living/simple_mob/animal/passive/mouse))
>>>>>>> 17eadd4... Merge pull request #5069 from Sebbe9123/mobpathfix
		return found_atom
	if(found_atom in friends)
		return null
	if(will_eat(found_atom))
		return found_atom

/mob/living/simple_animal/fox/fluff/Found(var/atom/found_atom)
	if (friend == found_atom)
		return null
	return ..()

/mob/living/simple_animal/fox/fluff
	vore_ignores_undigestable = 0
	vore_pounce_chance = 100
	vore_digest_chance = 0 // just use the toggle
	vore_default_mode = DM_HOLD //can use the toggle if you wanna be foxfood
	vore_standing_too = TRUE // gonna get pounced

/mob/living/simple_animal/fox/fluff/EatTarget()
	var/mob/living/TM = target_mob
	prey_excludes += TM //so they won't immediately re-eat someone who struggles out (or gets newspapered out) as soon as they're ate
	spawn(3600) // but if they hang around and get comfortable, they might get ate again
		if(src && TM)
			prey_excludes -= TM
	..() // will_eat check is carried out before EatTarget is called, so prey on the prey_excludes list isn't a problem.

<<<<<<< HEAD
/mob/living/simple_animal/hostile/goose
=======
/mob/living/simple_mob/animal/space/goose
>>>>>>> 17eadd4... Merge pull request #5069 from Sebbe9123/mobpathfix
	vore_active = 1
	// NO VORE SPRITES
	vore_max_size = RESIZE_SMALL

<<<<<<< HEAD
/mob/living/simple_animal/penguin
=======
/mob/living/simple_mob/animal/passive/penguin
>>>>>>> 17eadd4... Merge pull request #5069 from Sebbe9123/mobpathfix
	vore_active = 1
	// NO VORE SPRITES
	vore_max_size = RESIZE_SMALL


<<<<<<< HEAD
/mob/living/simple_animal/hostile/carp/pike
	vore_active = 1
	// NO VORE SPRITES

/mob/living/simple_animal/hostile/carp/holodeck
=======
/mob/living/simple_mob/animal/space/carp/pike
	vore_active = 1
	// NO VORE SPRITES

/mob/living/simple_mob/animal/space/carp/holodeck
>>>>>>> 17eadd4... Merge pull request #5069 from Sebbe9123/mobpathfix
	vore_icons = 0 // NO VORE SPRITES
	vore_digest_chance = 0
	vore_absorb_chance = 0

// Override stuff for holodeck carp to make them not digest when set to safe!
<<<<<<< HEAD
/mob/living/simple_animal/hostile/carp/holodeck/init_vore()
=======
/mob/living/simple_mob/animal/space/carp/holodeck/init_vore()
>>>>>>> 17eadd4... Merge pull request #5069 from Sebbe9123/mobpathfix
	. = ..()
	var/safe = (faction == "neutral")
	for(var/belly in vore_organs)
		var/obj/belly/B = belly
		B.digest_mode = safe ? DM_HOLD : vore_default_mode

<<<<<<< HEAD
/mob/living/simple_animal/hostile/carp/holodeck/set_safety(var/safe)
=======
/mob/living/simple_mob/animal/space/carp/holodeck/set_safety(var/safe)
>>>>>>> 17eadd4... Merge pull request #5069 from Sebbe9123/mobpathfix
	. = ..()
	for(var/belly in vore_organs)
		var/obj/belly/B = belly
		B.digest_mode = safe ? DM_HOLD : vore_default_mode

<<<<<<< HEAD
/mob/living/simple_animal/mouse
=======
/mob/living/simple_mob/animal/passive/mouse
>>>>>>> 17eadd4... Merge pull request #5069 from Sebbe9123/mobpathfix
	faction = "mouse" //Giving mice a faction so certain mobs can get along with them.