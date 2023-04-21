/obj/item/stock_parts/chem_cartridge
	name = "Chemical Cartridge"
	desc = "A propriatary casing holding a mix of raw material for use in chem dispensors."
	icon = 'icons/obj/chem_cartridge.dmi' //placeholder sprites
	icon_state = "simple" 
	item_state = "simple" 
	lefthand_file = 'icons/mob/inhands/misc/devices_lefthand.dmi' 
	righthand_file = 'icons/mob/inhands/misc/devices_righthand.dmi' 

	custom_materials = list(/datum/material/iron=1000, /datum/material/glass=500, /datum/material/plasma=100)
	force = 5
	throwforce = 5
	throw_speed = 2
	throw_range = 4
	w_class = WEIGHT_CLASS_NORMAL

	rating = 1
	var/charge = 0 //set on init
	var/maxCharge = 10000

/obj/item/stock_parts/chem_cartridge/Initialize()
	. = ..()
	charge = maxCharge

/obj/item/stock_parts/chem_cartridge/proc/takeMaterial(ammount)
	ammount = round(ammount)
	if(charge <= 0 || ammount > charge)
		return FALSE
	charge = (charge - ammount)
	return TRUE

/obj/item/stock_parts/chem_cartridge/proc/getPercentage()
	return round((charge / maxCharge) * 100)

/obj/item/stock_parts/chem_cartridge/examine()
	. = ..()
	. += span_info("It currently has [src.getPercentage()]% remaining.")

/obj/item/stock_parts/chem_cartridge/garbage
	name = "ancient chemical cartridge"
	desc = "A propriatary single use casing holding a mix of raw material for use in chem dispensors. This one is very worn and mostly used up."
	icon_state = "salvaged"
	item_state = "salvaged" 
	maxCharge = 2500
	custom_materials = list(/datum/material/iron=500, /datum/material/glass=500)

/obj/item/stock_parts/chem_cartridge/crafted
	name = "imitation chemical cartridge"
	desc = "A casing holding a mix of raw material for use in chem dispensors. This one is a crudely fabricated imitation."
	icon_state = "crafted"
	item_state = "crafted" 
	maxCharge = 5000
	custom_materials = list(/datum/material/iron=1000, /datum/material/glass=500)

/obj/item/stock_parts/chem_cartridge/simple
	name = "salvaged chemical cartridge"
	desc = "A casing holding a mix of raw material for use in chem dispensors. It looks like a mass produced knock-off."
	maxCharge = 10000
	custom_materials = list(/datum/material/iron=2000, /datum/material/glass=500, /datum/material/plasma = 100)

/obj/item/stock_parts/chem_cartridge/pristine
	name = "Pristine chemical cartridge"
	desc = "A propriatary single use casing holding a mix of raw material for use in chem dispensors. This one looks good as new"
	icon_state = "pristine"
	item_state = "pristine" 
	maxCharge = 20000
	custom_materials = list(/datum/material/iron=2000, /datum/material/glass=1000, /datum/material/plasma = 500)
