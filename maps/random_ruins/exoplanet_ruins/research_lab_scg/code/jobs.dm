/datum/job/submap/research_lab_scg
	title = "Colony Supervisor"
	total_positions = 1
	spawn_positions = 1
	whitelisted_species = list(SPECIES_HUMAN,SPECIES_SPACER,SPECIES_GRAVWORLDER,SPECIES_VATGROWN)
	info = "Главный на районе. Тот, кто связывает всех воедино, не давая развалиться на кусочки подобно планете, на которой они все находятся."
	outfit_type =
	access = list()
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_SCIENCE     = SKILL_TRAINED,
	                    SKILL_PILOT       = SKILL_TRAINED)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)
	skill_points = 30

/datum/job/submap/research_lab_scg/research
	title = "Research Supervisor"
	total_positions = 1
	spawn_positions = 1
	info = "Something"
	outfit_type =
	access = list(
		access_tox, access_tox_storage, access_emergency_storage, access_teleporter, access_bridge,
		access_research, access_mining, access_mining_office, access_mining_station, access_xenobiology, access_aquila,
		access_RC_announce, access_keycard_auth, access_xenoarch, access_nanotrasen, access_sec_guard, access_heads,
		access_expedition_shuttle, access_guppy, access_hangar, access_petrov, access_petrov_helm, access_guppy_helm,
		access_petrov_analysis, access_petrov_phoron, access_petrov_toxins, access_petrov_chemistry, access_petrov_rd,
		access_petrov_control, access_petrov_maint, access_pathfinder, access_explorer, access_eva, access_solgov_crew,
		access_expedition_shuttle, access_expedition_shuttle_helm, access_maint_tunnels, access_torch_fax, access_radio_comm,
		access_radio_sci, access_radio_exp, access_research_storage, access_cmo, access_ce, access_hop, access_hos, access_researchlab_lead, access_researchlab_supervisor
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_SCIENCE     = SKILL_TRAINED,
	                    SKILL_PILOT       = SKILL_TRAINED)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)
	skill_points = 30

/datum/job/submap/research_lab_scg/research/xenoarcheology
	title = "Lead Scientist of Xenoarcheology"
	access = list(
		access_tox, access_tox_storage, access_emergency_storage, access_teleporter, access_bridge,
		access_research, access_mining, access_mining_office, access_mining_station, access_xenobiology, access_aquila,
		access_RC_announce, access_keycard_auth, access_xenoarch, access_nanotrasen, access_sec_guard, access_heads,
		access_expedition_shuttle, access_guppy, access_hangar, access_petrov, access_petrov_helm, access_guppy_helm,
		access_petrov_analysis, access_petrov_phoron, access_petrov_toxins, access_petrov_chemistry, access_petrov_rd,
		access_petrov_control, access_petrov_maint, access_pathfinder, access_explorer, access_eva, access_solgov_crew,
		access_expedition_shuttle, access_expedition_shuttle_helm, access_maint_tunnels, access_torch_fax, access_radio_comm,
		access_radio_sci, access_radio_exp, access_research_storage, access_hos, access_researchlab_lead
	)
	outfit_type = /obj/item/card/id/torch/passenger/research/scientist/xenoarcheology
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_COMPUTER    = SKILL_BASIC,
	                    SKILL_FINANCE     = SKILL_BASIC,
	                    SKILL_BOTANY      = SKILL_BASIC,
	                    SKILL_ANATOMY     = SKILL_BASIC,
	                    SKILL_DEVICES     = SKILL_TRAINED,
	                    SKILL_SCIENCE     = SKILL_TRAINED)

	max_skill = list(   SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_DEVICES     = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)
	skill_points = 20

/datum/job/submap/research_lab_scg/research/roboticist
	title = "Lead Scientist of Roboticists"
	access = list(
		access_tox, access_tox_storage, access_emergency_storage, access_teleporter, access_bridge, access_rd,
		access_research, access_mining, access_mining_office, access_mining_station, access_xenobiology, access_aquila,
		access_RC_announce, access_keycard_auth, access_xenoarch, access_nanotrasen, access_sec_guard, access_heads,
		access_expedition_shuttle, access_guppy, access_hangar, access_petrov, access_petrov_helm, access_guppy_helm,
		access_petrov_analysis, access_petrov_phoron, access_petrov_toxins, access_petrov_chemistry, access_petrov_rd,
		access_petrov_control, access_petrov_maint, access_pathfinder, access_explorer, access_eva, access_solgov_crew,
		access_expedition_shuttle, access_expedition_shuttle_helm, access_maint_tunnels, access_torch_fax, access_radio_comm,
		access_radio_sci, access_radio_exp, access_research_storage, access_researchlab_lead
	)
	outfit_type = /obj/item/card/id/torch/passenger/research/scientist/roboticist
	min_skill = list(   SKILL_COMPUTER     = SKILL_BASIC,
	                    SKILL_EVA          = SKILL_BASIC,
	                    SKILL_CONSTRUCTION = SKILL_TRAINED,
	                    SKILL_ELECTRICAL   = SKILL_BASIC,
	                    SKILL_ATMOS        = SKILL_BASIC,
	                    SKILL_ENGINES      = SKILL_BASIC)

	max_skill = list(   SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX)
	skill_points = 20

/datum/job/submap/research_lab_scg/research/biology
	title = "Lead Scientist of Biology"
	access = list(
		access_tox, access_tox_storage, access_emergency_storage, access_teleporter, access_bridge,
		access_research, access_mining, access_mining_office, access_mining_station, access_xenobiology, access_aquila,
		access_RC_announce, access_keycard_auth, access_xenoarch, access_nanotrasen, access_sec_guard, access_heads,
		access_expedition_shuttle, access_guppy, access_hangar, access_petrov, access_petrov_helm, access_guppy_helm,
		access_petrov_analysis, access_petrov_phoron, access_petrov_toxins, access_petrov_chemistry, access_petrov_rd,
		access_petrov_control, access_petrov_maint, access_pathfinder, access_explorer, access_eva, access_solgov_crew,
		access_expedition_shuttle, access_expedition_shuttle_helm, access_maint_tunnels, access_torch_fax, access_radio_comm,
		access_radio_sci, access_radio_exp, access_research_storage, access_cmo, access_researchlab_lead
	)
	outfit_type = /obj/item/card/id/torch/passenger/research/scientist/biology
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_MEDICAL     = SKILL_EXPERIENCED,
	                    SKILL_ANATOMY     = SKILL_EXPERIENCED,
	                    SKILL_CHEMISTRY   = SKILL_BASIC,
						SKILL_DEVICES     = SKILL_TRAINED)

	max_skill = list(   SKILL_MEDICAL     = SKILL_MAX,
	                    SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_CHEMISTRY   = SKILL_MAX)
	skill_points = 20

/datum/job/submap/research_lab_scg/research/bluespace
	title = "Lead Scientist of Theorical Bluespace"
	outfit_type = /obj/item/card/id/torch/passenger/research/scientist/bluespace
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_COMPUTER    = SKILL_BASIC,
	                    SKILL_FINANCE     = SKILL_BASIC,
	                    SKILL_BOTANY      = SKILL_BASIC,
	                    SKILL_ANATOMY     = SKILL_BASIC,
	                    SKILL_DEVICES     = SKILL_TRAINED,
	                    SKILL_SCIENCE     = SKILL_TRAINED)

	max_skill = list(   SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_DEVICES     = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)
	skill_points = 20
	access = list(
		access_tox, access_tox_storage, access_emergency_storage, access_teleporter, access_bridge,
		access_research, access_mining, access_mining_office, access_mining_station, access_xenobiology, access_aquila,
		access_RC_announce, access_keycard_auth, access_xenoarch, access_nanotrasen, access_sec_guard, access_heads,
		access_expedition_shuttle, access_guppy, access_hangar, access_petrov, access_petrov_helm, access_guppy_helm,
		access_petrov_analysis, access_petrov_phoron, access_petrov_toxins, access_petrov_chemistry, access_petrov_rd,
		access_petrov_control, access_petrov_maint, access_pathfinder, access_explorer, access_eva, access_solgov_crew,
		access_expedition_shuttle, access_expedition_shuttle_helm, access_maint_tunnels, access_torch_fax, access_radio_comm,
		access_radio_sci, access_radio_exp, access_research_storage, access_ce, access_researchlab_lead
	)

/datum/job/submap/research_lab_scg/research/psycho
	title = "Lead Scientist of Psychology"
	outfit_type = /obj/item/card/id/torch/passenger/research/scientist/psycho
	min_skill = list(
		SKILL_BUREAUCRACY = SKILL_TRAINED,
		SKILL_MEDICAL = SKILL_BASIC
	)
	max_skill = list(
		SKILL_MEDICAL = SKILL_TRAINED,
		SKILL_ANATOMY = SKILL_TRAINED
	)
	skill_points = 20
	access = list(
		access_tox, access_tox_storage, access_emergency_storage, access_teleporter, access_bridge,
		access_research, access_mining, access_mining_office, access_mining_station, access_xenobiology, access_aquila,
		access_RC_announce, access_keycard_auth, access_xenoarch, access_nanotrasen, access_sec_guard, access_heads,
		access_expedition_shuttle, access_guppy, access_hangar, access_petrov, access_petrov_helm, access_guppy_helm,
		access_petrov_analysis, access_petrov_phoron, access_petrov_toxins, access_petrov_chemistry, access_petrov_rd,
		access_petrov_control, access_petrov_maint, access_pathfinder, access_explorer, access_eva, access_solgov_crew,
		access_expedition_shuttle, access_expedition_shuttle_helm, access_maint_tunnels, access_torch_fax, access_radio_comm,
		access_radio_sci, access_radio_exp, access_research_storage, access_researchlab_lead, access_xo
	)

// Lab Technicians


/datum/job/submap/research_lab_scg/research/xenoarcheology/lab
	title = "Lab Technician of Xenoarcheology"
	access = list(
		access_tox, access_tox_storage, access_maint_tunnels, access_research, access_mining_office,
		access_mining_station, access_xenobiology, access_xenoarch, access_nanotrasen, access_solgov_crew,
		access_expedition_shuttle, access_guppy, access_hangar, access_petrov, access_petrov_helm, access_guppy_helm,
		access_petrov_analysis, access_petrov_phoron, access_petrov_toxins, access_petrov_chemistry, access_petrov_control,
		access_petrov_maint, access_torch_fax, access_radio_sci, access_radio_exp, access_research_storage, access_explorer
	)
	outfit_type = /singleton/hierarchy/outfit/job/torch/passenger/research/scientist/lab

/datum/job/submap/research_lab_scg/research/robotist/lab
	title = "Lab Technician of Robotists"
	outfit_type = /singleton/hierarchy/outfit/job/torch/passenger/research/scientist/lab

/datum/job/submap/research_lab_scg/research/biology/lab
	title = "Lab Technician of Biology"
	outfit_type = /singleton/hierarchy/outfit/job/torch/passenger/research/scientist/lab

/datum/job/submap/research_lab_scg/research/bluespace/lab
	title = "Lab Technician of Theorical Bluespace"
	outfit_type = /singleton/hierarchy/outfit/job/torch/passenger/research/scientist/lab

/datum/job/submap/research_lab_scg/research/psycho/lab
	title = "Lab Technician of Psychology"
	outfit_type = /singleton/hierarchy/outfit/job/torch/passenger/research/scientist/lab


// Security


/datum/job/submap/research_lab_scg/agent
	title = "Security Agent"
	info = "You are the part of the Agency"
	outfit_type = /decl/hierarchy/outfit/job/aaaa/agent/aegis
	total_positions = 30
	skill_points = 30
	required_language = LANGUAGE_HUMAN_EURO

	min_skill = list(   SKILL_BUREAUCRACY = SKILL_TRAINED,
	                    SKILL_EVA         = SKILL_BASIC,
	                    SKILL_COMBAT      = SKILL_BASIC,
	                    SKILL_WEAPONS     = SKILL_TRAINED,
	                    SKILL_FORENSICS   = SKILL_BASIC)

	max_skill = list(   SKILL_COMBAT      = SKILL_MAX,
	                    SKILL_WEAPONS     = SKILL_MAX,
	                    SKILL_FORENSICS   = SKILL_MAX)
	skill_points = 20

	access = list(
		access_security, access_brig, access_armory, access_forensics_lockers,
		access_maint_tunnels, access_external_airlocks, access_emergency_storage,
		access_eva, access_sec_doors, access_solgov_crew, access_gun, access_torch_fax,
		access_radio_sec, access_bridge
	)

/*/datum/job/submap/aaaa_head/agent/leader/aegis
	title = "Bureau 12 Supervisor Agent"
	info = "You are the part of the Agency"
	access = list(access_aegis, access_aegis_captain)
	outfit_type = /decl/hierarchy/outfit/job/aaaa/agent/leader/aegis
	total_positions = 1
	skill_points = 35
*/

/datum/job/submap/research_lab_scg/service
	title = "Service staff"
	total_positions = 4
	spawn_positions = 4

/datum/job/submap/research_lab_scg/service/colonist
	title = "Colonist"
	total_positions = -1
	spawn_positions = -1

/datum/job/submap/research_lab_scg/service/maintence
	title = "Maintence Staff"
	total_positions = 2
	spawn_positions = 2
