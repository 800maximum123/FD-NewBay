/obj/item/device/kit
	icon_state = "modkit"
	icon = 'icons/obj/modkit.dmi'
	var/new_name = "exosuit"    //What is the variant called?
	var/new_desc = "An exosuit." //How is the new exosuit described?
	var/new_icon = "ripley"  //What base icon will the new exosuit use?
	var/new_icon_file
	var/uses = 1        // Uses before the kit deletes itself.

/obj/item/device/kit/examine(mob/user)
	. = ..()
	to_chat(user, "It has [uses] use\s left.")

/obj/item/device/kit/inherit_custom_item_data(datum/custom_item/citem)
	new_name = citem.item_name
	new_desc = citem.item_desc
	new_icon = citem.item_icon_state
	new_icon_file = CUSTOM_ITEM_OBJ
	. = src

/obj/item/device/kit/proc/use(amt, mob/user)
	uses -= amt
	playsound(get_turf(user), 'sound/items/Screwdriver.ogg', 50, 1)
	if(uses<1)
		qdel(src)

// Root hardsuit kit defines.
// Icons for modified hardsuits need to be in the proper .dmis because suit cyclers may cock them up.
/obj/item/device/kit/suit
	name = "voidsuit modification kit"
	desc = "A kit for modifying a voidsuit."
	uses = 2
	var/new_light_overlay
	var/new_mob_icon_file

/obj/item/device/kit/suit/inherit_custom_item_data(datum/custom_item/citem)
	. = ..()
	if(citem.additional_data["light_overlay"])
		new_light_overlay = citem.additional_data["light_overlay"]
	new_mob_icon_file = CUSTOM_ITEM_MOB

/obj/item/clothing/head/helmet/space/void/use_tool(obj/item/O, mob/living/user, list/click_params)
	if(istype(O,/obj/item/device/kit/suit))
		var/obj/item/device/kit/suit/kit = O
		SetName("[kit.new_name] suit helmet")
		desc = kit.new_desc
		icon_state = "[kit.new_icon]_helmet"
		item_state = "[kit.new_icon]_helmet"
		if(kit.new_icon_file)
			icon = kit.new_icon_file
		if(kit.new_mob_icon_file)
			icon_override = kit.new_mob_icon_file
		if(kit.new_light_overlay)
			light_overlay = kit.new_light_overlay
		to_chat(user, SPAN_NOTICE("You set about modifying the helmet into \the [src]."))
		var/mob/living/carbon/human/H = user
		if(istype(H))
			species_restricted = list(H.species.get_bodytype(H))
		kit.use(1,user)
		return TRUE

	return ..()

/obj/item/clothing/suit/space/void/use_tool(obj/item/O, mob/living/user, list/click_params)
	if(istype(O,/obj/item/device/kit/suit))
		var/obj/item/device/kit/suit/kit = O
		SetName("[kit.new_name] voidsuit")
		desc = kit.new_desc
		icon_state = "[kit.new_icon]_suit"
		item_state = "[kit.new_icon]_suit"
		if(kit.new_icon_file)
			icon = kit.new_icon_file
		if(kit.new_mob_icon_file)
			icon_override = kit.new_mob_icon_file
		to_chat(user, SPAN_NOTICE("You set about modifying the suit into \the [src]."))
		var/mob/living/carbon/human/H = user
		if(istype(H))
			species_restricted = list(H.species.get_bodytype(H))
		kit.use(1,user)
		return TRUE
	return ..()

// Mechs are handled in their attackby (mech_interaction.dm).
// [SIERRA-REMOVE] - MECHS_BY_SHEGAR - Не нужны
	/*



/obj/item/device/kit/paint
	name = "exosuit customisation kit"
	desc = "A kit containing all the needed tools and parts to repaint a exosuit."
	var/removable = null

/obj/item/device/kit/paint/examine(mob/user)
	. = ..()
	to_chat(user, "This kit will add a '[new_name]' decal to a exosuit'.")

// exosuit kits.
/obj/item/device/kit/paint/use(amt, mob/user)
	playsound(get_turf(user), 'sound/items/Screwdriver.ogg', 50, 1)


/obj/item/device/kit/paint/flames_red
	name = "\"Firestarter\" exosuit customisation kit"
	new_icon = "flames_red"

/obj/item/device/kit/paint/flames_blue
	name = "\"Burning Chrome\" exosuit customisation kit"
	new_icon = "flames_blue"

/obj/item/device/kit/paint/camouflage
	name = "\"Guerilla\" exosuit customisation kit"
	desc = "The exact same pattern the 76th Armored Gauntlet used in the Gaia war, now available for general use."
	new_icon = "cammo1"

/obj/item/device/kit/paint/camouflage/forest
	name = "\"Alpine\" exosuit customisation kit"
	new_icon = "cammo2"
	desc = "A muted pattern for alpine environments. Don't miss the forest for the trees!"



  */
// [/SIERRA-REMOVE]
