/datum/client_preference/immersive_sounds
	description = "Play machinery sounds"
	key = "SOUND_IMMERSIVE"

/datum/sound_token/instrument/immersive_sounds/PrivAddListener(atom/listener)
	var/mob/mob = listener
	if(istype(mob))
		if(mob.get_preference_value(/datum/client_preference/immersive_sounds) != GLOB.PREF_YES)
			return
	return ..()


/datum/sound_token/instrument/immersive_sounds/PrivUpdateListener(listener)
	var/mob/mob = listener
	if(istype(mob))
		if(mob.get_preference_value(/datum/client_preference/immersive_sounds) != GLOB.PREF_YES)
			PrivRemoveListener(listener)
			return
	return ..()
