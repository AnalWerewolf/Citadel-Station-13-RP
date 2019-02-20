/proc/get_typepath_shortnames(list/types)
	if (ispath(types))
		types = list(types)
	. = list()
	for(var/type in types)
		var/typename = "[type]"
		var/static/list/TYPES_SHORTCUTS = list(
			/obj/effect/decal/cleanable = "CLEANABLE",
			/obj/item/device/radio/headset = "HEADSET",
			/obj/item/clothing/head/helmet/space = "SPESSHELMET",
			/obj/item/weapon/book/manual = "MANUAL",
			/obj/item/weapon/reagent_containers/food/drinks = "DRINK",
			/obj/item/weapon/reagent_containers/food = "FOOD",
			/obj/item/weapon/reagent_containers = "REAGENT_CONTAINERS",
			/obj/machinery/atmospherics = "ATMOS_MECH",
			/obj/machinery/portable_atmospherics = "PORT_ATMOS",
			/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/missile_rack = "MECHA_MISSILE_RACK",
			/obj/item/mecha_parts/mecha_equipment = "MECHA_EQUIP",
			/obj/item/organ = "ORGAN",
			/obj/item = "ITEM",
			/obj/machinery = "MACHINERY",
			/obj/effect = "EFFECT",
			/obj = "O",
			/datum = "D",
			/turf/simulated/wall = "S-WALL",
			/turf/simulated/floor = "S-FLOOR",
			/turf/simulated = "SIMULATED",
			/turf/unsimulated/wall = "US-WALL",
			/turf/unsimulated/floor = "US-FLOOR",
			/turf/unsimulated = "UNSIMULATED",
			/turf = "T",
			/mob/living/carbon = "CARBON",
			/mob/living/simple_mob = "SIMPLE",
			/mob/living = "LIVING",
			/mob = "M"
		)
		for (var/tn in TYPES_SHORTCUTS)
			if (copytext(typename,1, length("[tn]/")+1)=="[tn]/" /*findtextEx(typename,"[tn]/",1,2)*/ )
				typename = TYPES_SHORTCUTS[tn]+copytext(typename,length("[tn]/"))
				break
		.[typename] = type
