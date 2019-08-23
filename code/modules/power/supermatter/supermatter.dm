
#define NITROGEN_RETARDATION_FACTOR 0.20				//Higher == N2 slows reaction more
#define THERMAL_RELEASE_MODIFIER 5						//Higher == less heat released during reaction, not to be confused with the above values
#define PHORON_RELEASE_MODIFIER 325						//Higher == less plasma released by reaction
#define OXYGEN_RELEASE_MODIFIER 750						//Higher == less oxygen released at high temperature/power#define REACTION_POWER_MODIFIER 1.1			//Higher == more overall power
#define REACTION_POWER_MODIFIER 0.55					//Higher == more overall power
#define MATTER_POWER_CONVERSION 10						//Crystal converts 1/this value of stored matter into energy.

#define OXYGEN_TRANSMIT_MODIFIER 1.5						//Higher == Bigger bonus to power generation.
#define PLASMA_TRANSMIT_MODIFIER 6

#define N2O_HEAT_RESISTANCE 6							//Higher == Gas makes the crystal more resistant against heat damage.

#define POWERLOSS_INHIBITION_GAS_THRESHOLD 0.20			//Higher == Higher percentage of inhibitor gas needed before the charge inertia chain reaction effect starts.
#define POWERLOSS_INHIBITION_MOLE_THRESHOLD 20			//Higher == More moles of the gas are needed before the charge inertia chain reaction effect starts.        //Scales powerloss inhibition down until this amount of moles is reached
#define POWERLOSS_INHIBITION_MOLE_BOOST_THRESHOLD 500	//bonus powerloss inhibition boost if this amount of moles is reached

#define MOLE_PENALTY_THRESHOLD 1800						//Higher == Shard can absorb more moles before triggering the high mole penalties.
#define MOLE_HEAT_PENALTY 350							//Heat damage scales around this. Too hot setups with this amount of moles do regular damage, anything above and below is scaled
#define POWER_PENALTY_THRESHOLD 5000					//Higher == Engine can generate more power before triggering the high power penalties.
#define SEVERE_POWER_PENALTY_THRESHOLD 7000				//Same as above, but causes more dangerous effects
#define CRITICAL_POWER_PENALTY_THRESHOLD 9000			//Even more dangerous effects, threshold for tesla delamination
#define HEAT_PENALTY_THRESHOLD 40						//Higher == Crystal safe operational temperature is higher.
#define DAMAGE_HARDCAP 0.002
#define DAMAGE_INCREASE_MULTIPLIER 0.25

//These would be what you would get at point blank, decreases with distance
#define DETONATION_RADS 200
#define DETONATION_HALLUCINATION 600

#define WARNING_DELAY 60

#define HALLUCINATION_RANGE(P) (min(7, round(P ** 0.25)))

//If integrity percent remaining is less than these values, the monitor sets off the relevant alarm.
#define SUPERMATTER_DELAM_PERCENT 5
#define SUPERMATTER_EMERGENCY_PERCENT 25
#define SUPERMATTER_DANGER_PERCENT 50
#define SUPERMATTER_WARNING_PERCENT 100

#define SUPERMATTER_COUNTDOWN_TIME 30 SECONDS

/*
	How to tweak the SM

	POWER_FACTOR		directly controls how much power the SM puts out at a given level of excitation (power var). Making this lower means you have to work the SM harder to get the same amount of power.
	CRITICAL_TEMPERATURE	The temperature at which the SM starts taking damage.

	CHARGING_FACTOR		Controls how much emitter shots excite the SM.
	DAMAGE_RATE_LIMIT	Controls the maximum rate at which the SM will take damage due to high temperatures.
*/

//Controls how much power is produced by each collector in range - this is the main parameter for tweaking SM balance, as it basically controls how the power variable relates to the rest of the game.
#define POWER_FACTOR 1.0
#define DECAY_FACTOR 700								//Affects how fast the supermatter power decays
#define CRITICAL_TEMPERATURE 3200						//K
#define CHARGING_FACTOR 0.05
#define DAMAGE_RATE_LIMIT 3								//damage rate cap at power = 300, scales linearly with power


// Base variants are applied to everyone on the same Z level
// Range variants are applied on per-range basis: numbers here are on point blank, it scales with the map size (assumes square shaped Z levels)
#define DETONATION_RADS 20
#define DETONATION_HALLUCINATION_BASE 300
#define DETONATION_HALLUCINATION_RANGE 300
#define DETONATION_HALLUCINATION 600


#define WARNING_DELAY 20								//seconds between warnings.

/obj/machinery/power/supermatter
	name = "Supermatter"
	desc = "A strangely translucent and iridescent crystal. <font color='red'>You get headaches just from looking at it.</font>"
	icon = 'icons/obj/engine.dmi'
	icon_state = "darkmatter"
	density = 1
	anchored = 0
	light_range = 4

	var/gasefficency = 0.15

	var/base_icon_state = "darkmatter"

	var/final_countdown = FALSE

	var/damage = 0
	var/damage_archived = 0
	var/safe_alert = "Crystaline hyperstructure returning to safe operating levels."
	var/safe_warned = 0
	var/public_alert = 0 //Stick to Engineering frequency except for big warnings when integrity bad
	var/warning_point = 50
	var/warning_alert = "Danger! Crystal hyperstructure instability!"
	var/damage_penalty_point = 550
	var/emergency_point = 700
	var/emergency_alert = "CRYSTAL DELAMINATION IMMINENT."
	var/explosion_point = 900

	light_color = "#8A8A00"
	var/warning_color = "#B8B800"
	var/emergency_color = "#D9D900"

	var/grav_pulling = 0
	var/pull_radius = 14
	// Time in ticks between delamination ('exploding') and exploding (as in the actual boom)
	var/pull_time = 100
	var/explosion_power = 35
	var/temp_factor = 30
	var/emergency_issued = 0

	// Time in 1/10th of seconds since the last sent warning
	var/lastwarning = 0
	var/power = 0

	// This stops spawning redundand explosions. Also incidentally makes supermatter unexplodable if set to 1.
	var/exploded = 0


	var/n2comp = 0					// raw composition of each gas in the chamber, ranges from 0 to 1
	var/plasmacomp = 0
	var/o2comp = 0
	var/co2comp = 0
	var/n2ocomp = 0

	var/combined_gas = 0
	var/gasmix_power_ratio = 0
	var/dynamic_heat_modifier = 1
	var/dynamic_heat_resistance = 1
	var/powerloss_inhibitor = 1
	var/powerloss_dynamic_scaling= 0
	var/power_transmission_bonus = 0
	var/mole_heat_penalty = 0

	var/matter_power = 0

	//Temporary values so that we can optimize this
	//How much the bullets damage should be multiplied by when it is added to the internal variables
	var/config_bullet_energy = 2
	//How much of the power is left after processing is finished?
//        var/config_power_reduction_per_tick = 0.5
	//How much hallucination should it produce per unit of power?
	var/config_hallucination_power = 0.1

	//for logging
	var/has_been_powered = FALSE
	var/has_reached_emergency = FALSE

	// For making hugbox supermatter
	var/takes_damage = TRUE
	var/produces_gas = TRUE

	var/debug = 0

/obj/machinery/power/supermatter/Initialize()
	. = ..()
	uid = gl_uid++
	SSair.atmos_machinery += src
	GLOB.poi_list |= src
	investigate_log("Supermatter crystal has been created at ([x],[y],[z] - <A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[x];Y=[y];Z=[z]'>JMP</a>)",0,1)

	var/soundloop = new(list(src), TRUE)

/obj/machinery/power/supermatter_crystal/Destroy()
	investigate_log("Supermatter crystal has been destroyed at ([x],[y],[z] - <A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[x];Y=[y];Z=[z]'>JMP</a>)",0,1)
	SSair.atmos_machinery -= src
	GLOB.poi_list -= src
	QDEL_NULL(soundloop)
	return ..()

/obj/machinery/power/supermatter/examine(mob/user)
	..()
	if(!ishuman(user))
		return
	var/range = HALLUCINATION_RANGE(power)
	for(var/mob/living/carbon/human/H in viewers(range, src))
		if(H != user)
			continue
		if(!istype(H.glasses, /obj/item/clothing/glasses/meson))
			to_chat(H, "<span class='danger'>You get headaches just from looking at it.</span>")
		return

/obj/machinery/power/supermatter/proc/explode()
	message_admins("Supermatter exploded at ([x],[y],[z] - <A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[x];Y=[y];Z=[z]'>JMP</a>)",0,1)
	log_game("SUPERMATTER([x],[y],[z]) Exploded. Power:[power], Damage:[damage], Integrity:[get_integrity()]")
	anchored = 1
	grav_pulling = 1
	exploded = 1
	var/turf/TS = get_turf(src)		// The turf supermatter is on. SM being in a locker, mecha, or other container shouldn't block it's effects that way.
	if(!TS)
		return
	for(var/z in GetConnectedZlevels(TS.z))
		radiation_repository.z_radiate(locate(1, 1, z), DETONATION_RADS, 1)
	for(var/mob/living/mob in living_mob_list)
		var/turf/T = get_turf(mob)
		if(T && (loc.z == T.z))
			if(istype(mob, /mob/living/carbon/human))
				//Hilariously enough, running into a closet should make you get hit the hardest.
				var/mob/living/carbon/human/H = mob
				H.hallucination += max(50, min(300, DETONATION_HALLUCINATION * sqrt(1 / (get_dist(mob, src) + 1)) ) )
	spawn(pull_time)
		explosion(get_turf(src), explosion_power, explosion_power * 2, explosion_power * 3, explosion_power * 4, 1)
		qdel(src)
		return

	var/turf/T = get_turf(src)
	for(var/mob/M in GLOB.player_list)
		if(M.loc.z == T.z)
			SEND_SOUND(M, 'sound/effects/charge.ogg')
			to_chat(M, "<span class='boldannounce'>Everything around you goes wavy and you feel reality distort, if only for a moment...</span>")
	if(combined_gas > MOLE_PENALTY_THRESHOLD)
		investigate_log("Supermatter collapsed into singularity at ([x],[y],[z] - <A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[x];Y=[y];Z=[z]'>JMP</a>)",0,1)
		qdel(src)
		if(T)
			var/obj/singularity/S = new(T)
			S.energy = 800
	else
		investigate_log("Supermatter has exploded at ([x],[y],[z] - <A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[x];Y=[y];Z=[z]'>JMP</a>)",0,1)
		explosion(get_turf(T), explosion_power * max(gasmix_power_ratio, 0.205) * 0.5 , explosion_power * max(gasmix_power_ratio, 0.205) + 2, explosion_power * max(gasmix_power_ratio, 0.205) + 4 , explosion_power * max(gasmix_power_ratio, 0.205) + 6, 1, 1)
		if(power > POWER_PENALTY_THRESHOLD)
			investigate_log("Supermatter delaminated into tesla at ([x],[y],[z] - <A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[x];Y=[y];Z=[z]'>JMP</a>)",0,1)
			var/obj/singularity/energy_ball/E = new(T)
			E.energy = power
		qdel(src)

/obj/machinery/power/supermatter/proc/consume_turf(turf/T)
	var/oldtype = T.type
	var/turf/newT = T.ScrapeAway()
	if(newT.type == oldtype)
		return
	playsound(T, 'sound/effects/supermatter.ogg', 50, 1)
	T.visible_message("<span class='danger'>[T] smacks into [src] and rapidly flashes to ash.</span>",\
	"<span class='italics'>You hear a loud crack as you are washed with a wave of heat.</span>")
	T.CalculateAdjacentTurfs()

//Changes color and luminosity of the light to these values if they were not already set
/obj/machinery/power/supermatter/proc/shift_light(var/lum, var/clr)
	if(lum != light_range || clr != light_color)
		set_light(lum, l_color = clr)

/obj/machinery/power/supermatter/proc/get_integrity()
	var/integrity = damage / explosion_point
	integrity = round(100 - integrity * 100)
	integrity = integrity < 0 ? 0 : integrity
	return integrity


/obj/machinery/power/supermatter/proc/announce_warning()
	var/integrity = get_integrity()
	var/alert_msg = " Integrity at [integrity]%"

	if(damage > emergency_point)
		alert_msg = emergency_alert + alert_msg
		lastwarning = world.timeofday - WARNING_DELAY * 4
	else if(damage >= damage_archived) // The damage is still going up
		safe_warned = 0
		alert_msg = warning_alert + alert_msg
		lastwarning = world.timeofday
	else if(!safe_warned)
		safe_warned = 1 // We are safe, warn only once
		alert_msg = safe_alert
		lastwarning = world.timeofday
	else
		alert_msg = null
	if(alert_msg)
		global_announcer.autosay(alert_msg, "Supermatter Monitor", "Engineering")
		log_game("SUPERMATTER([x],[y],[z]) Emergency engineering announcement. Power:[power], Damage:[damage], Integrity:[get_integrity()]")
		//Public alerts
		if((damage > emergency_point) && !public_alert)
			global_announcer.autosay("WARNING: SUPERMATTER CRYSTAL DELAMINATION IMMINENT!", "Supermatter Monitor")
			admin_chat_message(message = "SUPERMATTER DELAMINATING!", color = "#FF2222") //VOREStation Add
			public_alert = 1
			log_game("SUPERMATTER([x],[y],[z]) Emergency PUBLIC announcement. Power:[power], Damage:[damage], Integrity:[get_integrity()]")
		else if(safe_warned && public_alert)
			global_announcer.autosay(alert_msg, "Supermatter Monitor")
			public_alert = 0


/obj/machinery/power/supermatter/get_transit_zlevel()
	//don't send it back to the station -- most of the time
	if(prob(99))
		var/list/candidates = using_map.accessible_z_levels.Copy()
		for(var/zlevel in using_map.station_levels)
			candidates.Remove("[zlevel]")
		candidates.Remove("[src.z]")

		if(candidates.len)
			return text2num(pickweight(candidates))

	return ..()

/obj/machinery/power/supermatter/process_atmos()
	var/turf/T = loc

	if(isnull(T))		// We have a null turf...something is wrong, stop processing this entity.
		return PROCESS_KILL

	if(!istype(T)) 	//We are in a crate or somewhere that isn't turf, if we return to turf resume processing but for now.
		return  //Yeah just stop.
	if(istype(T, /turf/simulated/wall))
		consume_turf(T)

	if(power)
		soundloop.volume = min(40, (round(power/100)/50)+1) // 5 +1 volume per 20 power. 2500 power is max

	//Ok, get the air from the turf
	var/datum/gas_mixture/env = T.return_air()

	var/datum/gas_mixture/removed

	if(produces_gas)
		//Remove gas from surrounding area
		removed = env.remove(gasefficency * env.total_moles())
	else
		// Pass all the gas related code an empty gas container
		removed = new()

	damage_archived = damage
	if(!removed || !removed.total_moles() || isspaceturf(T)) //we're in space or there is no gas to process
		if(takes_damage)
			damage += max((power / 1000) * DAMAGE_INCREASE_MULTIPLIER, 0.1) // always does at least some damage
	else
		if(takes_damage)
			//causing damage
			damage = max(damage + (max(CLAMP(removed.total_moles() / 200, 0.5, 1) * removed.temperature - ((T0C + HEAT_PENALTY_THRESHOLD)*dynamic_heat_resistance), 0) * mole_heat_penalty / 150 ) * DAMAGE_INCREASE_MULTIPLIER, 0)
			damage = max(damage + (max(power - POWER_PENALTY_THRESHOLD, 0)/500) * DAMAGE_INCREASE_MULTIPLIER, 0)
			damage = max(damage + (max(combined_gas - MOLE_PENALTY_THRESHOLD, 0)/80) * DAMAGE_INCREASE_MULTIPLIER, 0)

			//healing damage
			if(combined_gas < MOLE_PENALTY_THRESHOLD)
				damage = max(damage + (min(removed.temperature - (T0C + HEAT_PENALTY_THRESHOLD), 0) / 150 ), 0)

			//capping damage
			damage = min(damage_archived + (DAMAGE_HARDCAP * explosion_point),damage)
			if(damage > damage_archived && prob(10))
				playsound(get_turf(src), 'sound/effects/empulse.ogg', 50, 1)

		//calculating gas related values
		combined_gas = max(removed.total_moles(), 0)

		plasmacomp = max(removed.gases[/datum/gas/plasma]/combined_gas, 0)
		o2comp = max(removed.gases[/datum/gas/oxygen]/combined_gas, 0)
		co2comp = max(removed.gases[/datum/gas/carbon_dioxide]/combined_gas, 0)

		n2ocomp = max(removed.gases[/datum/gas/nitrous_oxide]/combined_gas, 0)
		n2comp = max(removed.gases[/datum/gas/nitrogen]/combined_gas, 0)

		gasmix_power_ratio = min(max(plasmacomp + o2comp + co2comp - n2comp, 0), 1)

		dynamic_heat_modifier = max((plasmacomp * PLASMA_HEAT_PENALTY)+(o2comp * OXYGEN_HEAT_PENALTY)+(co2comp * CO2_HEAT_PENALTY)+(n2comp * NITROGEN_HEAT_MODIFIER), 0.5)
		dynamic_heat_resistance = max(n2ocomp * N2O_HEAT_RESISTANCE, 1)

		power_transmission_bonus = max((plasmacomp * PLASMA_TRANSMIT_MODIFIER) + (o2comp * OXYGEN_TRANSMIT_MODIFIER), 0)

		//more moles of gases are harder to heat than fewer, so let's scale heat damage around them
		mole_heat_penalty = max(combined_gas / MOLE_HEAT_PENALTY, 0.25)

		if (combined_gas > POWERLOSS_INHIBITION_MOLE_THRESHOLD && co2comp > POWERLOSS_INHIBITION_GAS_THRESHOLD)
			powerloss_dynamic_scaling = CLAMP(powerloss_dynamic_scaling + CLAMP(co2comp - powerloss_dynamic_scaling, -0.02, 0.02), 0, 1)
		else
			powerloss_dynamic_scaling = CLAMP(powerloss_dynamic_scaling - 0.05,0, 1)
		powerloss_inhibitor = CLAMP(1-(powerloss_dynamic_scaling * CLAMP(combined_gas/POWERLOSS_INHIBITION_MOLE_BOOST_THRESHOLD,1 ,1.5)),0 ,1)

		if(matter_power)
			var/removed_matter = max(matter_power/MATTER_POWER_CONVERSION, 40)
			power = max(power + removed_matter, 0)
			matter_power = max(matter_power - removed_matter, 0)

		var/temp_factor = 50

		if(gasmix_power_ratio > 0.8)
			// with a perfect gas mix, make the power less based on heat
			icon_state = "[base_icon_state]_glow"
		else
			// in normal mode, base the produced energy around the heat
			temp_factor = 30
			icon_state = base_icon_state

		power = max( (removed.temperature * temp_factor / T0C) * gasmix_power_ratio + power, 0) //Total laser power plus an overload

		if(prob(50))
			radiation_pulse(src, power * (1 + power_transmission_bonus/10))

		var/device_energy = power * REACTION_POWER_MODIFIER

		//To figure out how much temperature to add each tick, consider that at one atmosphere's worth
		//of pure oxygen, with all four lasers firing at standard energy and no N2 present, at room temperature
		//that the device energy is around 2140. At that stage, we don't want too much heat to be put out
		//Since the core is effectively "cold"

		//Also keep in mind we are only adding this temperature to (efficiency)% of the one tile the rock
		//is on. An increase of 4*C @ 25% efficiency here results in an increase of 1*C / (#tilesincore) overall.
		removed.temperature += ((device_energy * dynamic_heat_modifier) / THERMAL_RELEASE_MODIFIER)

		removed.temperature = max(0, min(removed.temperature, 2500 * dynamic_heat_modifier))

		//Calculate how much gas to release
		removed.gases[/datum/gas/plasma] += max((device_energy * dynamic_heat_modifier) / PLASMA_RELEASE_MODIFIER, 0)

		removed.gases[/datum/gas/oxygen] += max(((device_energy + removed.temperature * dynamic_heat_modifier) - T0C) / OXYGEN_RELEASE_MODIFIER, 0)

		if(produces_gas)
			env.merge(removed)
			air_update_turf()

	for(var/mob/living/carbon/human/l in view(src, HALLUCINATION_RANGE(power))) // If they can see it without mesons on.  Bad on them.
		if(!istype(l.glasses, /obj/item/clothing/glasses/meson))
			var/D = sqrt(1 / max(1, get_dist(l, src)))
			l.hallucination += power * config_hallucination_power * D
			l.hallucination = CLAMP(0, 200, l.hallucination)

	for(var/mob/living/l in range(src, round((power / 100) ** 0.25)))
		var/rads = (power / 10) * sqrt( 1 / max(get_dist(l, src),1) )
		l.rad_act(rads)

	power -= ((power/500)**3) * powerloss_inhibitor

	if(power > POWER_PENALTY_THRESHOLD || damage > damage_penalty_point)

		if(power > POWER_PENALTY_THRESHOLD)
			playsound(src.loc, 'sound/weapons/emitter2.ogg', 100, 1, extrarange = 10)
			supermatter_zap(src, 5, min(power*2, 20000))
			supermatter_zap(src, 5, min(power*2, 20000))
			if(power > SEVERE_POWER_PENALTY_THRESHOLD)
				supermatter_zap(src, 5, min(power*2, 20000))
				if(power > CRITICAL_POWER_PENALTY_THRESHOLD)
					supermatter_zap(src, 5, min(power*2, 20000))
		else if (damage > damage_penalty_point && prob(20))
			playsound(src.loc, 'sound/weapons/emitter2.ogg', 100, 1, extrarange = 10)
			supermatter_zap(src, 5, CLAMP(power*2, 4000, 20000))

		if(prob(15) && power > POWER_PENALTY_THRESHOLD)
			supermatter_pull(src, power/750)
		if(prob(5))
			supermatter_anomaly_gen(src, FLUX_ANOMALY, rand(5, 10))
		if(power > SEVERE_POWER_PENALTY_THRESHOLD && prob(5) || prob(1))
			supermatter_anomaly_gen(src, GRAVITATIONAL_ANOMALY, rand(5, 10))
		if(power > SEVERE_POWER_PENALTY_THRESHOLD && prob(2) || prob(0.3) && power > POWER_PENALTY_THRESHOLD)
			supermatter_anomaly_gen(src, PYRO_ANOMALY, rand(5, 10))

	if(damage > warning_point) // while the core is still damaged and it's still worth noting its status
		if((REALTIMEOFDAY - lastwarning) / 10 >= WARNING_DELAY)
			alarm()

			if(damage > emergency_point)
				radio.talk_into(src, "[emergency_alert] Integrity: [get_integrity()]%", common_channel)
				lastwarning = REALTIMEOFDAY
				if(!has_reached_emergency)
					investigate_log("has reached the emergency point for the first time.", INVESTIGATE_SUPERMATTER)
					message_admins("[src] has reached the emergency point [ADMIN_JMP(src)].")
					has_reached_emergency = TRUE
			else if(damage >= damage_archived) // The damage is still going up
				radio.talk_into(src, "[warning_alert] Integrity: [get_integrity()]%", engineering_channel)
				lastwarning = REALTIMEOFDAY - (WARNING_DELAY * 5)

			else                                                 // Phew, we're safe
				radio.talk_into(src, "[safe_alert] Integrity: [get_integrity()]%", engineering_channel)
				lastwarning = REALTIMEOFDAY

			if(power > POWER_PENALTY_THRESHOLD)
				radio.talk_into(src, "Warning: Hyperstructure has reached dangerous power level.", engineering_channel)
				if(powerloss_inhibitor < 0.5)
					radio.talk_into(src, "DANGER: CHARGE INERTIA CHAIN REACTION IN PROGRESS.", engineering_channel)

			if(combined_gas > MOLE_PENALTY_THRESHOLD)
				radio.talk_into(src, "Warning: Critical coolant mass reached.", engineering_channel)

		if(damage > explosion_point)
			countdown()

	return 1


/obj/machinery/power/supermatter_crystal/bullet_act(obj/item/projectile/Proj)
	var/turf/L = loc
	if(!istype(L))
		return FALSE
	if(!istype(Proj.firer, /obj/machinery/power/emitter))
		investigate_log("has been hit by [Proj] fired by [key_name(Proj.firer)]", INVESTIGATE_SUPERMATTER)
	if(Proj.flag != "bullet")
		power += Proj.damage * config_bullet_energy
		if(!has_been_powered)
			investigate_log("has been powered for the first time.", INVESTIGATE_SUPERMATTER)
			message_admins("[src] has been powered for the first time [ADMIN_JMP(src)].")
			has_been_powered = TRUE
	else if(takes_damage)
		damage += Proj.damage * config_bullet_energy
	return FALSE

/obj/machinery/power/supermatter/attack_robot(mob/user as mob)
	if(Adjacent(user))
		return attack_hand(user)
	else
		ui_interact(user)
	return

/obj/machinery/power/supermatter/attack_ai(mob/user as mob)
	ui_interact(user)

/obj/machinery/power/supermatter/attack_hand(mob/user as mob)
	var/datum/gender/TU = gender_datums[user.get_visible_gender()]
	user.visible_message("<span class=\"warning\">\The [user] reaches out and touches \the [src], inducing a resonance... [TU.his] body starts to glow and bursts into flames before flashing into ash.</span>",\
		"<span class=\"danger\">You reach out and touch \the [src]. Everything starts burning and all you can hear is ringing. Your last thought is \"That was not a wise decision.\"</span>",\
		"<span class=\"warning\">You hear an uneartly ringing, then what sounds like a shrilling kettle as you are washed with a wave of heat.</span>")

	Consume(user)

// This is purely informational UI that may be accessed by AIs or robots
/obj/machinery/power/supermatter/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1)
	var/data[0]

	data["integrity_percentage"] = round(get_integrity())
	var/datum/gas_mixture/env = null
	if(!istype(src.loc, /turf/space))
		env = src.loc.return_air()

	if(!env)
		data["ambient_temp"] = 0
		data["ambient_pressure"] = 0
	else
		data["ambient_temp"] = round(env.temperature)
		data["ambient_pressure"] = round(env.return_pressure())
	data["detonating"] = grav_pulling

	ui = GLOB.nanomanager.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "supermatter_crystal.tmpl", "Supermatter Crystal", 500, 300)
		ui.set_initial_data(data)
		ui.open()
		ui.set_auto_update(1)


/obj/machinery/power/supermatter/attackby(obj/item/weapon/W as obj, mob/living/user as mob)
	user.visible_message("<span class=\"warning\">\The [user] touches \a [W] to \the [src] as a silence fills the room...</span>",\
		"<span class=\"danger\">You touch \the [W] to \the [src] when everything suddenly goes silent.\"</span>\n<span class=\"notice\">\The [W] flashes into dust as you flinch away from \the [src].</span>",\
		"<span class=\"warning\">Everything suddenly goes silent.</span>")

	user.drop_from_inventory(W)
	Consume(W)

	user.apply_effect(150, IRRADIATE)


/obj/machinery/power/supermatter/Bumped(atom/AM as mob|obj)
	if(istype(AM, /obj/effect))
		return
	if(istype(AM, /mob/living))
		var/mob/living/M = AM
		var/datum/gender/T = gender_datums[M.get_visible_gender()]
		AM.visible_message("<span class=\"warning\">\The [AM] slams into \the [src] inducing a resonance... [T.his] body starts to glow and catch flame before flashing into ash.</span>",\
		"<span class=\"danger\">You slam into \the [src] as your ears are filled with unearthly ringing. Your last thought is \"Oh, fuck.\"</span>",\
		"<span class=\"warning\">You hear an uneartly ringing, then what sounds like a shrilling kettle as you are washed with a wave of heat.</span>")
	else if(!grav_pulling) //To prevent spam, detonating supermatter does not indicate non-mobs being destroyed
		AM.visible_message("<span class=\"warning\">\The [AM] smacks into \the [src] and rapidly flashes to ash.</span>",\
		"<span class=\"warning\">You hear a loud crack as you are washed with a wave of heat.</span>")

	Consume(AM)


/obj/machinery/power/supermatter/proc/Consume(var/mob/living/user)
	if(istype(user))
		user.dust()
		power += 200
	else
		qdel(user)

	power += 200

		//Some poor sod got eaten, go ahead and irradiate people nearby.
	for(var/mob/living/l in range(10))
		if(l in view())
			l.show_message("<span class=\"warning\">As \the [src] slowly stops resonating, you find your skin covered in new radiation burns.</span>", 1,\
				"<span class=\"warning\">The unearthly ringing subsides and you notice you have new radiation burns.</span>", 2)
		else
			l.show_message("<span class=\"warning\">You hear an uneartly ringing and notice your skin is covered in fresh radiation burns.</span>", 2)
	var/rads = 500
	radiation_repository.radiate(src, rads)

/proc/supermatter_pull(var/atom/target, var/pull_range = 255, var/pull_power = STAGE_FIVE)
	for(var/atom/A in range(pull_range, target))
		A.singularity_pull(target, pull_power)

/obj/machinery/power/supermatter/GotoAirflowDest(n) //Supermatter not pushed around by airflow
	return

/obj/machinery/power/supermatter/RepelAirflowDest(n)
	return

/obj/machinery/power/supermatter/shard //Small subtype, less efficient and more sensitive, but less boom.
	name = "Supermatter Shard"
	desc = "A strangely translucent and iridescent crystal that looks like it used to be part of a larger structure. <font color='red'>You get headaches just from looking at it.</font>"
	icon_state = "darkmatter_shard"
	base_icon_state = "darkmatter_shard"

	warning_point = 50
	emergency_point = 400
	explosion_point = 600

	gasefficency = 0.125

	pull_radius = 5
	pull_time = 45
	explosion_power = 3

/obj/machinery/power/supermatter/shard/announce_warning() //Shards don't get announcements
	return
