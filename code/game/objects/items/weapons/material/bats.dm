/obj/item/material/twohanded/baseballbat
	name = "bat"
	desc = "HOME RUN!"
	icon_state = "metalbat0"
	base_icon = "metalbat"
	throwforce = 7
	attack_verb = list("smashed", "beaten", "slammed", "smacked", "struck", "battered", "bonked")
	hitsound = 'sound/weapons/genhit3.ogg'
	default_material = "wood"
	force_divisor = 1.1           // 22 when wielded with weight 20 (steel)
	unwielded_force_divisor = 0.7 // 15 when unwielded based on above.
	dulled_divisor = 0.75		  // A "dull" bat is still gonna hurt
	slot_flags = SLOT_BACK

//Predefined materials go here.
/obj/item/material/twohanded/baseballbat/metal/New(var/newloc)
	..(newloc,"steel")

/obj/item/material/twohanded/baseballbat/uranium/New(var/newloc)
	..(newloc,"uranium")

/obj/item/material/twohanded/baseballbat/gold/New(var/newloc)
	..(newloc,"gold")

/obj/item/material/twohanded/baseballbat/platinum/New(var/newloc)
	..(newloc,"platinum")

/obj/item/material/twohanded/baseballbat/diamond/New(var/newloc)
	..(newloc,"diamond")

/obj/item/material/twohanded/penbat
	name = "penetrator"
	desc = "The letter E has been lovingly engraved into the handle. When this wobbles, it sounds exactly like shame."
	icon_state = "penbat0"
	base_icon = "penbat0"
	default_material = "plastic"
