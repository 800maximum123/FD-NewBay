/*
/decl/hierarchy/outfit/job/aaaa/agent/aegis
	name = "Bureau 12 Agent"
	uniform = /obj/item/clothing/under/lawyer/infil
	glasses = /obj/item/clothing/glasses/aviators_black
	suit = /obj/item/clothing/suit/storage/toggle/agent_jacket
	shoes = /obj/item/clothing/shoes/dress
//	r_pocket = /obj/item/device/radio/map_preset/aaaa_head
//	l_ear = /obj/item/device/radio/headset/map_preset/aaaa_head
//	id_types = list(/obj/item/card/id/bureua)
	backpack_contents = list(/obj/item/clothing/accessory/armor_plate/sneaky/tactical=1)

/decl/hierarchy/outfit/job/aaaa/agent/leader/aegis
	name = "Bureau 12 Supervisor"
	uniform = /obj/item/clothing/under/lawyer/infil
	glasses = /obj/item/clothing/glasses/aviators_black
	suit = /obj/item/clothing/suit/storage/toggle/agent_jacket
	shoes = /obj/item/clothing/shoes/dress
//	r_pocket = /obj/item/device/radio/map_preset/aaaa_head
//	l_ear = /obj/item/device/radio/headset/map_preset/aaaa_head/leader
//	id_types = list(/obj/item/card/id/bureua/leader)
	backpack_contents = list(/obj/item/clothing/accessory/armor_plate/sneaky/tactical=1)
*/

// Research

/singleton/hierarchy/outfit/job/torch/passenger/research/scientist/lab
	name = "Scientist - Lab-Technician"
	uniform = /obj/item/clothing/under/rank/scientist
	shoes = /obj/item/clothing/shoes/white
	pda_type = /obj/item/modular_computer/pda/science
	id_types = list(/obj/item/card/id/torch/passenger/research/scientist/lab)

/decl/hierarchy/outfit/job/researchlab/agent
	name = "Security Agent"
	uniform = /obj/item/clothing/under/lawyer/infil
	glasses = /obj/item/clothing/glasses/aviators_black
	suit = /obj/item/clothing/suit/storage/toggle/agent_jacket
	shoes = /obj/item/clothing/shoes/dress
	r_pocket = /obj/item/device/radio
	l_ear = /obj/item/device/radio
	id_types = list(/obj/item/card/id/torch/crew/security/brigchief/agent)
	backpack_contents = list(/obj/item/clothing/accessory/armor_plate/sneaky/tactical=1)

/obj/item/card/id/torch/passenger/research/scientist/xenoarcheology
	job_access_type = /datum/job/submap/research_lab_scg/research/xenoarcheology

/obj/item/card/id/torch/passenger/research/scientist/roboticist
	job_access_type = /datum/job/submap/research_lab_scg/research/roboticist

/obj/item/card/id/torch/passenger/research/scientist/biology
	job_access_type = /datum/job/submap/research_lab_scg/research/biology

/obj/item/card/id/torch/passenger/research/scientist/bluespace
	job_access_type = /datum/job/submap/research_lab_scg/research/bluespace

/obj/item/card/id/torch/passenger/research/scientist/psycho
	job_access_type = /datum/job/submap/research_lab_scg/research/psycho

/obj/item/card/id/torch/passenger/research/scientist/lab
	job_access_type = /datum/job/submap/research_lab_scg/research/xenoarcheology/lab


// card stuff
/obj/item/card/id/torch/gold/colony
	desc = "A golden identification card belonging to the Colony Supervisor."
	item_state = "gold_id"
	job_access_type = /datum/job/captain
	color = "#d4c780"
	extra_details = list("goldstripe")

/obj/item/card/id/torch/crew/security/brigchief/agent
	job_access_type = /datum/job/submap/research_lab_scg/agent
	extra_details = list("onegoldstripe")
