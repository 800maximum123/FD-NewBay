/obj/structure/barrier
	name = "defensive barrier"
	desc = "A portable barrier - usually, you can see it on defensive positions or in storages in important areas. \
	You can deploy it with a screwdriver for maximum protection, or keep it in mobile position. \
	Also, demontage can be done with a crowbar. In case of structural damage, can be repaired with welding tool."
	icon = 'packs/infinity/icons/obj/barrier.dmi'
	icon_state = "barrier_rised"
	density = TRUE
	throwpass = 1
	anchored = TRUE
	atom_flags = ATOM_FLAG_CLIMBABLE | ATOM_FLAG_CHECKS_BORDER
	var/health = 200
	var/maxhealth = 200
	var/deployed = 0
	var/basic_chance = 50

/obj/structure/barrier/Initialize()
	. = ..()
	update_layers()
	update_icon()

/obj/structure/barrier/examine(mob/user)
	..()
	if(health>=200)
		to_chat(user, SPAN_NOTICE("It looks undamaged."))
	if(health>=140 && health<200)
		USE_FEEDBACK_FAILURE("It has small dents.")
	if(health>=80 && health<140)
		USE_FEEDBACK_FAILURE("It has medium dents.")
	if(health<80)
		to_chat(user, "<span class='danger'>It will break apart soon!</span>")

/obj/structure/barrier/Destroy()
	if(health <= 0)
		visible_message("<span class='danger'>[src] was destroyed!</span>")
		playsound(src, 'sound/effects/clang.ogg', 100, 1)
		new /obj/item/stack/material/steel(src.loc)
		new /obj/item/stack/material/steel(src.loc)
	return ..()

/obj/structure/barrier/proc/update_layers()
	if(dir != SOUTH)
		layer = initial(layer) + 0.1
	else if(dir == SOUTH && density)
		layer = ABOVE_HUMAN_LAYER
	else
		layer = initial(layer) + 0.1

/obj/structure/barrier/on_update_icon()
	if(density && !deployed)
		icon_state = "barrier_rised"
	if(!density && !deployed)
		icon_state = "barrier_downed"
	if(deployed)
		icon_state = "barrier_deployed"

/obj/structure/barrier/set_dir()
	..()
	update_layers()

/obj/structure/barrier/CanPass(atom/movable/mover, turf/target, height = 0, air_group = 0)
	if(!density || air_group || !height)
		return TRUE

	if(istype(mover, /obj/item/projectile))
		var/obj/item/projectile/proj = mover

		if(Adjacent(proj?.firer))
			return TRUE

		if(mover.dir != reverse_direction(dir))
			return TRUE

		if(get_dist(proj.starting, loc) <= 1)//allows to fire from 1 tile away of barrier
			return TRUE

		return check_cover(mover, target)

	if(get_dir(get_turf(src), target) == dir && density)//turned in front of barrier
		return FALSE
	return TRUE

/obj/structure/barrier/CheckExit(atom/movable/O as mob|obj, target as turf)
	if(O?.checkpass(PASS_FLAG_TABLE))
		return 1
	if (get_dir(loc, target) == dir)
		return !density
	else
		return 1

/obj/structure/barrier/attack_hand(mob/living/carbon/human/user as mob)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(user.species.can_shred(user) && user.a_intent == I_HURT)
		take_damage(20)
		return
	if(deployed)
		to_chat(user, SPAN_NOTICE("[src] is already deployed. You can't move it."))
	else
		if(do_after(user, 5, src))
			playsound(src, 'sound/effects/extout.ogg', 100, 1)
			density = !density
			to_chat(user, SPAN_NOTICE("You're getting [density ? "up" : "down"] [src]."))
			update_layers()
			update_icon()

/obj/structure/barrier/use_tool(obj/item/tool, mob/user, list/click_params)

	if(isWelder(tool))
		var/obj/item/weldingtool/WT = tool
		if(health == maxhealth)
			to_chat(user, SPAN_NOTICE("\The [src] is fully repaired."))
			return TRUE
		if(istype(tool, /obj/item/weldingtool) && !WT.isOn())
			to_chat(user, SPAN_NOTICE("[tool] should be turned on firstly."))
			return TRUE
		if(istype(tool, /obj/item/weldingtool) && !WT.remove_fuel(0,user))
			to_chat(user, SPAN_NOTICE("You need more welding fuel to complete this task."))
			return TRUE
		visible_message(SPAN_WARNING("[user] is repairing \the [src]..."))
		playsound(src, 'sound/items/Welder.ogg', 100, 1)
		if(do_after(user, max(5, health / 5), src) && WT?.isOn())
			to_chat(user, SPAN_NOTICE("You finish repairing the damage to [src]."))
			playsound(src, 'sound/items/Welder2.ogg', 100, 1)
			health = maxhealth

		update_icon()
		return TRUE

	if(isScrewdriver(tool))
		if(density)
			visible_message("<span class='danger'>[user] begins to [deployed ? "un" : ""]deploy \the [src]...</span>")
			playsound(src, 'sound/items/Screwdriver.ogg', 100, 1)
			if(do_after(user, 30, src))
				visible_message(SPAN_NOTICE("[user] has [deployed ? "un" : ""]deployed \the [src]."))
				deployed = !deployed
				if(deployed)
					basic_chance = 70
				else
					basic_chance = 50
		update_icon()
		return TRUE

	if(isCrowbar(tool))
		if(!deployed && !density)
			visible_message("<span class='danger'>[user] is begins disassembling \the [src]...</span>")
			playsound(src, 'sound/items/Crowbar.ogg', 100, 1)
			if(do_after(user, 60, src))
				var/obj/item/barrier/B = new /obj/item/barrier(get_turf(user))
				visible_message(SPAN_NOTICE("[user] dismantled \the [src]."))
				playsound(src, 'sound/items/Deconstruct.ogg', 100, 1)
				B.health = health
				B.add_fingerprint(user)
				qdel(src)
		else
			to_chat(user, SPAN_NOTICE("You should unsecure \the [src] firstly. Use a screwdriver."))
		update_icon()
		return TRUE
	else
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		take_damage(tool.force)
		return ..()

/obj/structure/barrier/bullet_act(obj/item/projectile/P)
	..()
	take_damage(P.get_structure_damage())

/obj/structure/barrier/attack_generic(mob/user, damage, attack_verb)
	take_damage(damage)
	attack_animation(user)
	if(damage >=1)
		user.visible_message("<span class='danger'>[user] [attack_verb] \the [src]!</span>")
	else
		user.visible_message("<span class='danger'>[user] [attack_verb] \the [src] harmlessly!</span>")
	return 1

/obj/structure/barrier/proc/take_damage(damage)
	health -= damage * 0.5
	if(health <= 0)
		qdel(src)
	else
		playsound(src.loc, 'sound/effects/bang.ogg', 75, 1)

/obj/structure/barrier/proc/check_cover(obj/item/projectile/P, turf/from)
	var/turf/cover = get_turf(src)
	var/chance = basic_chance

	if(!cover)
		return 1

	var/mob/living/carbon/human/M = locate(src.loc)
	if(M)
		chance += 30

		if(M.lying)
			chance += 20

	if(get_dir(loc, from) == dir)
		chance += 10

	if(prob(chance))
		visible_message(SPAN_WARNING("[P] hits \the [src]!"))
		bullet_act(P)
		return 0

	return 1

/obj/structure/barrier/MouseDrop_T(mob/user as mob)
	if(src.loc != user.loc)
		to_chat(user, "You start climbing onto [src]...")
		step(src, get_dir(src, src.dir))

/obj/structure/barrier/ex_act(severity)
	switch(severity)
		if(1.0)
			new /obj/item/stack/material/steel(src.loc)
			new /obj/item/stack/material/steel(src.loc)
			if(prob(50))
				new /obj/item/stack/material/steel(src.loc)
			qdel(src)
			return
		if(2.0)
			new /obj/item/stack/material/steel(src.loc)
			if(prob(50))
				new /obj/item/stack/material/steel(src.loc)
			qdel(src)
			return
		else
	return

/obj/item/barrier
	name = "portable barrier"
	desc = "A portable barrier. Usually, you can see it on defensive positions or in storages at important areas. \
	You can deploy it with a screwdriver for maximum protection, or keep it in mobile position. \
	Also, demontage can be done with a crowbar.In case of structural damage, can be repaired with welding tool."
	icon = 'packs/infinity/icons/obj/items.dmi'
	icon_state = "barrier_hand"
	w_class = 4
	var/health = 200

/obj/item/barrier/proc/turf_check(mob/user as mob)
	for(var/obj/structure/barrier/D in user.loc.contents)
		if((D.dir == user.dir))
			USE_FEEDBACK_FAILURE("There is no more space.")
			return 1
	return 0

/obj/item/barrier/attack_self(mob/user as mob)
	if(!isturf(user.loc))
		USE_FEEDBACK_FAILURE("You can't place it here.")
		return
	if(turf_check(user))
		return

	if(do_after(user, 1 SECOND, src))
		playsound(src, 'sound/effects/extout.ogg', 100, 1)
		var/obj/structure/barrier/B = new(user.loc)
		B.set_dir(user.dir)
		B.health = health
		user.drop_item()
		qdel(src)

/obj/item/barrier/use_tool(obj/item/tool, mob/user, list/click_params)
	if(health != 200 && isWelder(tool))
		var/obj/item/weldingtool/WT = tool
		if(istype(tool, /obj/item/weldingtool) && !WT.isOn())
			to_chat(user, SPAN_NOTICE("The [tool] should be turned on firstly."))
			return TRUE
		if(istype(tool, /obj/item/weldingtool) && !WT.remove_fuel(0,user))
			to_chat(user, SPAN_NOTICE("You need more welding fuel to complete this task."))
			return TRUE
		to_chat(user, SPAN_NOTICE("You start repairing the damage to [src]."))
		playsound(src, 'sound/items/Welder.ogg', 100, 1)
		if(do_after(user, max(5, health / 5), src) && WT?.isOn())
			to_chat(user, SPAN_NOTICE("You finish repairing the damage to [src]."))
			playsound(src, 'sound/items/Welder2.ogg', 100, 1)
			health = 200
		return TRUE
	return ..()
