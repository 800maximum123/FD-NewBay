// VOIDSUITS //

/obj/item/clothing/suit/space/void/medical/alt/sol/expo
	name = "exploration medical voidsuit"
	desc = "The bulky Exoplanet Exploration Unit is a standard voidsuit for Expeditionary Corps' medical specialists in field operations. It features extra padding and respectable radiation-resistant lining."
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_MINOR,
		laser = ARMOR_LASER_MINOR,
		energy = ARMOR_ENERGY_RESISTANT,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_RESISTANT
		)
	allowed = list(/obj/item/device/flashlight,/obj/item/tank,/obj/item/device/suit_cooling_unit,/obj/item/stack/flag,/obj/item/device/scanner/health,/obj/item/device/gps,/obj/item/pinpointer/radio,/obj/item/material/hatchet/machete,/obj/item/shovel)

/obj/item/clothing/head/helmet/space/void/medical/alt/sol/expo
	name = "exploration medical voidsuit helmet"
	desc = "The bulky Exoplanet Exploration Unit is a standard voidsuit for Expeditionary Corps' medical specialists in field operations. It features extra padding and respectable radiation-resistant lining."
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_MINOR,
		laser = ARMOR_LASER_MINOR,
		energy = ARMOR_ENERGY_RESISTANT,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_RESISTANT
		)
	allowed = list(/obj/item/device/flashlight,/obj/item/tank,/obj/item/device/suit_cooling_unit,/obj/item/stack/flag,/obj/item/device/scanner/health,/obj/item/device/gps,/obj/item/pinpointer/radio,/obj/item/material/hatchet/machete,/obj/item/shovel)


/obj/item/clothing/suit/space/void/atmos/alt/sol/expo
	name = "exploration engineering voidsuit"
	desc = "The bulky Exoplanet Exploration Unit is a standard voidsuit for Expeditionary Corps' engineering specialists in field operations. It features extra padding and respectable radiation-resistant lining."
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_MINOR,
		laser = ARMOR_LASER_MINOR,
		energy = ARMOR_ENERGY_RESISTANT,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_RESISTANT
		)
	allowed = list(/obj/item/device/flashlight,/obj/item/tank,/obj/item/device/suit_cooling_unit,/obj/item/stack/flag,/obj/item/device/scanner/health,/obj/item/device/gps,/obj/item/pinpointer/radio,/obj/item/material/hatchet/machete,/obj/item/shovel)

/obj/item/clothing/head/helmet/space/void/atmos/alt/sol/expo
	name = "exploration engineering voidsuit helmet"
	desc = "The bulky Exoplanet Exploration Unit is a standard voidsuit for Expeditionary Corps' engineering specialists in field operations. It features extra padding and respectable radiation-resistant lining."
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_MINOR,
		laser = ARMOR_LASER_MINOR,
		energy = ARMOR_ENERGY_RESISTANT,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_RESISTANT
		)
	allowed = list(/obj/item/device/flashlight,/obj/item/tank,/obj/item/device/suit_cooling_unit,/obj/item/stack/flag,/obj/item/device/scanner/health,/obj/item/device/gps,/obj/item/pinpointer/radio,/obj/item/material/hatchet/machete,/obj/item/shovel)

/obj/machinery/suit_storage_unit/explorer/medic
	name = "Exploration Medic Voidsuit Storage Unit"
	suit = /obj/item/clothing/suit/space/void/medical/alt/sol/expo
	helmet = /obj/item/clothing/head/helmet/space/void/medical/alt/sol/expo
	boots = /obj/item/clothing/shoes/magboots
	tank = /obj/item/tank/oxygen
	mask = /obj/item/clothing/mask/breath
	req_access = list(access_explorer)
	islocked = 1

/obj/machinery/suit_storage_unit/explorer/engineer
	name = "Exploration Engineer Voidsuit Storage Unit"
	suit = /obj/item/clothing/suit/space/void/atmos/alt/sol/expo
	helmet = /obj/item/clothing/head/helmet/space/void/atmos/alt/sol/expo
	boots = /obj/item/clothing/shoes/magboots
	tank = /obj/item/tank/oxygen
	mask = /obj/item/clothing/mask/breath
	req_access = list(access_explorer)
	islocked = 1

// VOIDSUITS //

// LOCKERS //

/singleton/closet_appearance/secure_closet/torch/exploration/medic
	extra_decals = list(
		"stripe_vertical_mid_full" = COLOR_WHITE,
		"exped" = COLOR_PURPLE
	)

/obj/structure/closet/secure_closet/explorer/medic
	name = "expedition medic's locker"
	req_access = list(access_explorer)
	closet_appearance = /singleton/closet_appearance/secure_closet/torch/exploration/medic

/obj/structure/closet/secure_closet/explorer/medic/WillContain()
	return list(
		/obj/item/storage/belt/medical/emt,
		/obj/item/storage/box/latexgloves,
		/obj/item/clothing/glasses/hud/health,
		/obj/item/storage/box/masks,
		/obj/item/storage/firstaid/adv,
		/obj/item/storage/firstaid/stab,
		/obj/item/bodybag/rescue/loaded,
		/obj/item/bodybag/rescue/loaded,
		/obj/item/device/scanner/health,
		/obj/item/roller_bed,
		/obj/item/clothing/accessory/storage/holster/machete,
		/obj/item/device/radio,
		/obj/item/device/gps,
		/obj/item/taperoll/research,
		/obj/item/shuttle_beacon,
		/obj/item/clothing/accessory/storage/webbing_large,
		/obj/item/device/scanner/gas,
		/obj/item/device/radio/headset/exploration,
		/obj/item/device/radio/headset/exploration/alt,
		/obj/item/device/binoculars,
		/obj/item/clothing/accessory/buddy_tag,
		/obj/item/storage/firstaid/individual/military,
		/obj/item/material/knife/folding/swiss/explorer,
		/obj/item/device/camera,
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/explorer, /obj/item/storage/backpack/satchel/explorer)),
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/dufflebag, /obj/item/storage/backpack/messenger/explorer)),
		new /datum/atom_creator/weighted(list(/obj/item/device/flashlight, /obj/item/device/flashlight/flare, /obj/item/device/flashlight/flare/glowstick/random))
	)

/singleton/closet_appearance/secure_closet/torch/exploration/engineer
	extra_decals = list(
		"stripe_vertical_mid_full" = COLOR_ORANGE,
		"exped" = COLOR_PURPLE
	)

/obj/structure/closet/secure_closet/explorer/engineer
	name = "expedition engineer's locker"
	req_access = list(access_explorer)
	closet_appearance = /singleton/closet_appearance/secure_closet/torch/exploration/engineer

/obj/structure/closet/secure_closet/explorer/engineer/WillContain()
	return list(
		/obj/item/storage/belt/utility/full,
		/obj/item/clothing/gloves/insulated,
		/obj/item/device/multitool,
		/obj/item/clothing/accessory/storage/holster/machete,
		/obj/item/device/radio,
		/obj/item/device/gps,
		/obj/item/taperoll/research,
		/obj/item/shuttle_beacon,
		/obj/item/clothing/accessory/storage/webbing_large,
		/obj/item/device/scanner/gas,
		/obj/item/device/radio/headset/exploration,
		/obj/item/device/radio/headset/exploration/alt,
		/obj/item/device/binoculars,
		/obj/item/clothing/accessory/buddy_tag,
		/obj/item/storage/firstaid/individual/military,
		/obj/item/material/knife/folding/swiss/explorer,
		/obj/item/clothing/glasses/welding,
		/obj/item/clothing/head/welding,
		/obj/item/device/camera,
		/obj/item/gun/energy/plasmacutter,
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/explorer, /obj/item/storage/backpack/satchel/explorer)),
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/dufflebag, /obj/item/storage/backpack/messenger/explorer)),
		new /datum/atom_creator/weighted(list(/obj/item/device/flashlight, /obj/item/device/flashlight/flare, /obj/item/device/flashlight/flare/glowstick/random))
	)

// LOCKERS //

// ID CARDS //

/obj/item/card/id/torch/crew/expmed
	job_access_type = /datum/job/expmed
	detail_color = COLOR_PURPLE

/obj/item/card/id/torch/crew/expeng
	job_access_type = /datum/job/expeng
	detail_color = COLOR_PURPLE

// ID CARDS //

// RADIO //

/obj/item/device/radio/headset/expmed
	name = "expedition medic's headset"
	desc = "A headset for a one to bossy over medical dummies."
	icon_state = "par_headset"
	item_state = "headset"
	ks1type = /obj/item/device/encryptionkey/headset_expedition_medic

/obj/item/device/radio/headset/expmed/alt
	name = "expedition medic's bowman headset"
	icon_state = "par_headset_alt"
	item_state = "headset_alt"

/obj/item/device/radio/headset/expeng
	name = "expedition engineer's headset"
	desc = "A headset for a one to bossy over engineering dummies."
	icon_state = "par_headset"
	item_state = "headset"
	ks1type = /obj/item/device/encryptionkey/headset_expedition_engineer

/obj/item/device/radio/headset/expeng/alt
	name = "expedition engineer's bowman headset"
	icon_state = "par_headset_alt"
	item_state = "headset_alt"

/obj/item/device/encryptionkey/headset_expedition_medic
	name = "exploration medic's encryption key"
	icon_state = "srv_cypherkey"
	channels = list("Exploration" = 1, "Hailing" = 1, "Medical" = 1)

/obj/item/device/encryptionkey/headset_expedition_engineer
	name = "exploration engineer's encryption key"
	icon_state = "srv_cypherkey"
	channels = list("Exploration" = 1, "Hailing" = 1, "Engineering" = 1)

// RADIO //

// OUTFITS //

/singleton/hierarchy/outfit/job/torch/crew/exploration/expmed
	name = OUTFIT_JOB_NAME("Expedition Medic - Expeditionary Corps")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/exploration
	shoes = /obj/item/clothing/shoes/dutyboots
	id_types = list(/obj/item/card/id/torch/crew/expmed)
	pda_type = /obj/item/modular_computer/pda/explorer
	l_ear = /obj/item/device/radio/headset/expmed

/singleton/hierarchy/outfit/job/torch/crew/exploration/expmed/fleet
	name = OUTFIT_JOB_NAME("Expedition Medic - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/combat/exploration
	shoes = /obj/item/clothing/shoes/dutyboots

/*/decl/hierarchy/outfit/job/torch/crew/exploration/expmed/army
	name = OUTFIT_JOB_NAME("Expedition Medic - Army")
	uniform = /obj/item/clothing/under/solgov/utility/army/exploration
	shoes = /obj/item/clothing/shoes/dutyboots*/

/singleton/hierarchy/outfit/job/torch/crew/exploration/expeng
	name = OUTFIT_JOB_NAME("Expedition Engineer - Expeditionary Corps")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/exploration
	shoes = /obj/item/clothing/shoes/dutyboots
	id_types = list(/obj/item/card/id/torch/crew/expeng)
	pda_type = /obj/item/modular_computer/pda/explorer
	l_ear = /obj/item/device/radio/headset/expeng

/singleton/hierarchy/outfit/job/torch/crew/exploration/expeng/fleet
	name = OUTFIT_JOB_NAME("Expedition Engineer - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/combat/exploration
	shoes = /obj/item/clothing/shoes/dutyboots

/*/decl/hierarchy/outfit/job/torch/crew/exploration/expeng/army
	name = OUTFIT_JOB_NAME("Expedition Engineer - Army")
	uniform = /obj/item/clothing/under/solgov/utility/army/exploration
	shoes = /obj/item/clothing/shoes/dutyboots*/

// OUTFITS //
