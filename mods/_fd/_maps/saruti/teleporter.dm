var/global/list/obj/step_trigger/mobius_rift/seamless_portal/SEAMLESS_TELEPORTERS = list()

/obj/step_trigger/mobius_rift/seamless_portal
	var/id_tag
	var/id_target

/obj/step_trigger/mobius_rift/seamless_portal/set_destination(D)
	if(id_target)
		for(var/obj/step_trigger/mobius_rift/seamless_portal/teleport in SEAMLESS_TELEPORTERS)
			if(teleport.id_tag == src.id_target)
				dest = id_target
				return
	else
		dest = D

// MAKING YOUR BRAIN HURT

/obj/step_trigger/client_clearer
	affect_ghosts = 1

/obj/step_trigger/client_clearer/Trigger(mob/human)
	. = ..()
	if(!istype(human) || !human.client)
		return
	human.client.dir = NORTH
	human.client.view = "15x15"

/obj/step_trigger/client_rotator
	affect_ghosts = 1
	dir = SOUTH
	var/view = "15x15"
	var/mob_dir

/obj/step_trigger/client_rotator/Trigger(mob/human)
	. = ..()

	if(!istype(human) || !human.client)
		return
	human.client.view = "15x15"
	human.client.dir = dir
	if(!mob_dir)
		human.dir = GLOB.reverse_dir[human.dir]
		return
	else
		human.dir = mob_dir
