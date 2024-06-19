/obj/item/book/necrotek
	name = "Necrotek"
	desc = "Bro. What you want from me?"
	icon = 'mods/_fd/_maps/saruti/planets/items/books.dmi'
	icon_state = "ledge0"

/turf/asphalt/lava
	icon = 'mods/_fd/_maps/saruti/planets/turfs/asphalt.dmi'
	icon_state = "lava_asphalt"

/turf/simulated/floor/beach/sand/saruti
	icon = 'mods/_fd/_maps/saruti/planets/turfs/plating.dmi'
	icon_state = "asteroidplating"

/obj/saruti/ark
	name = "alien wall"
	desc = "You feel a sense of dread from just looking at this wall. Its surface seems to be constantly moving, as if it were breathing."
	icon = 'maps/away/blueriver/riverturfs.dmi'
	icon_state = "evilwall_1"
	opacity = 0
	density = 0
	alpha = 170

	temperature = 233

/obj/saruti/ark/Initialize()
	. = ..()

	if(prob(80))
		icon_state = "evilwall_[rand(1,8)]"



/obj/saruti/ark/bluespace/Initialize()
	. = ..()

	if(prob(80))
		icon_state = "evilwall_[rand(1,8)]"
		alpha = (100-rand(-20, 20))

/obj/smoke_wall/no_time
	var/outer_radius = 2

/obj/smoke_wall/no_time
	icon_state = "smoke wall"
	anchored = TRUE
	opacity = FALSE
	layer = ABOVE_HUMAN_LAYER
	icon = 'icons/effects/smoke.dmi'
	icon_state = "smoke"
	pixel_x = -9
	pixel_y = -6
	timer = -1

/obj/smoke_wall/New()
	. = ..()
	if(timer <= 0)
		return
	run_timer()

/obj/smoke_wall/no_time/ammonia
	color = "#07d4009d"

// TO-DO
// client - dir
// Добавить телепортерам поиск Дира.

/client/New()
	..()
	dir = NORTH

/client/verb/spinleft()
	set name = "Spin View CCW"
	set category = "OOC"
	dir = turn(dir, 90)

/client/verb/spinright()
	set name = "Spin View CW"
	set category = "OOC"
	dir = turn(dir, -90)

/client/GetBackThatScreen
	view = "15x15"

// Gate

/obj/machinery/door/blast/bordergate
	icon = 'mods/_fd/_maps/saruti/gates1.dmi'
	icon_state_open = "door0"
	icon_state_opening = "doorc0"
	icon_state_closed = "door1"
	icon_state_closing = "doorc1"
	icon_state = "door1"
	name = "gate"
	desc = "A large mechanical gate allowing or disallowing access to the outpost."
	open_sound = 'sound/machines/shutters_open.ogg'
	close_sound = 'sound/machines/shutters_close.ogg'
	open_layer = ABOVE_WINDOW_LAYER
	atmos_canpass = 1
	block_air_zones = 0

	opacity = 0

/obj/machinery/door/blast/bordergate/central
	icon = 'mods/_fd/_maps/saruti/gates2.dmi'

/obj/machinery/door/blast/bordergate/right
	icon = 'mods/_fd/_maps/saruti/gates3.dmi'
