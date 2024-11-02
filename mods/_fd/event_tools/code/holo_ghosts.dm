// Нужен исключительно для того, чтобы активировать остальные спавнеры

/obj/structure/holo_starter
	name = "holo orb"
	desc = "Сфера, содержащая в себе короткий фрагмент воспоминаний на основе когнитивных данных участников."
	var/cutscene_id = "test"
	icon = 'packs/infinity/icons/mob/hologram.dmi'
	icon_state = "Vega"
	density = FALSE
	anchored = TRUE

/obj/structure/holo_starter/attack_hand(mob/user)
	if(do_after(user, 5 SECONDS, src, DO_PUBLIC_UNIQUE | DO_BAR_OVER_USER))
		for(var/obj/holo_spawner/mobs in orange(10, src))
			if(mobs.character_id == cutscene_id)
				if(mobs.next_play > 0)
					continue
				mobs.start_scene()

/obj/holo_spawner
	name = "ТЫ НЕ ДОЛЖЕН ЭТОГО ВИДЕТЬ"
	desc = "Не, серьёзно, это баг!"
	icon = 'mods/_fd/event_tools/icons/landmarks_static.dmi'
	icon_state = "ai_spawn"
	var/character_id = "test"
	var/character_to_spawn = null
	var/next_play = 0
	invisibility = 50

/obj/holo_spawner/New()
	. = ..()
	START_PROCESSING(SSprocessing, src)

/obj/holo_spawner/Process()
	if(next_play > 0)
		next_play -= 1

/obj/holo_spawner/proc/start_scene()
	if(next_play <= 0)
		new character_to_spawn(src.loc)
		next_play += 220

/mob/living/simple_animal/holo_npc
	name = "TEST"
	desc = "TEST"
	icon = 'mods/_fd/fd_assets/icons/animals/prime_soul.dmi'
	icon_state = "body"
	icon_living = "body"
	icon_dead = "body"
	response_help = "tries to poke"
	response_disarm = "shoves"
	response_harm = "hits"
	speed = 4
	movement_cooldown = 0
	maxHealth = 999999
	health = 999999
	a_intent = I_HELP
	faction = "holo"
	status_flags = GODMODE
	does_spin = FALSE
	density = FALSE
	anchored = TRUE
	pass_flags = PASS_FLAG_TABLE|PASS_FLAG_GLASS|PASS_FLAG_GRILLE
	mob_size = MOB_SMALL

	alpha = 0
	color = COLOR_TEAL

	var/seen = FALSE

/mob/living/simple_animal/holo_npc/proc/start_thinking()
	return

/mob/living/simple_animal/holo_npc/Life()
	..()

	if(!seen)
		for(var/mob/living/L in orange(10,src))
			if(L.key && L.client)
				seen = TRUE
				animate(src, 3 SECONDS, alpha = 150)
/*				alpha = 50
				spawn(1 SECOND)
					alpha = 80
				spawn(2 SECONDS)
					alpha = 100
				spawn(3 SECOND)
					alpha = 120
				spawn(4 SECONDS)
					alpha = 150 */
				start_thinking()
				break

/mob/living/simple_animal/holo_npc/ai_announcer
	name = "-SYSTEM MAINFRAME-"
	desc = "Alarm announcement system."
	icon = 'packs/infinity/icons/mob/hologram.dmi'
	icon_state = "Caution"
	icon_living = "Caution"
	icon_dead = "Caution"
	color = "#ffffff"

/mob/living/simple_animal/holo_npc/ai_announcer/Life()
	..()

	if(!seen)
		for(var/mob/living/L in orange(10,src))
			if(L.key && L.client)
				seen = TRUE
				start_thinking()
				break

/mob/living/simple_animal/holo_npc/ai_announcer/start_thinking()
	alpha = 0
	invisibility = 50
/*	spawn(2 SECOND)
		alpha = 0
	spawn(3 SECONDS)
		alpha = 0
	spawn(4 SECOND)
		alpha = 0
	spawn(5 SECONDS)
		alpha = 0*/

	spawn(195 SECOND)
		invisibility = 0
		animate(src, 5 SECONDS, alpha = 150)
/*	spawn(196 SECONDS)
		alpha = 80
	spawn(197 SECOND)
		alpha = 100
	spawn(198 SECOND)
		alpha = 120
	spawn(199 SECOND)
		alpha = 150*/

	spawn(200 SECONDS)
		ISay("|ВНИМАНИЕ| ЗАФИКСИРОВАНЫ СЕРЬЁЗНЫЕ СТРУКТУРНЫЕ ПОВРЕЖДЕНИЯ.")
	spawn(204 SECONDS)
		ISay("|ВНИМАНИЕ| ОТКАЗ СИСТЕМЫ ЖИЗНЕОБЕСПЕЧЕНИЯ.")
		playsound(src.loc, 'sound/misc/redalert1.ogg', 100, 1)
	spawn(210 SECONDS)
		ISay("|ВНИМАНИЕ| ЧЕТЫРЕ ЧЛЕНА ЭКИПАЖА НУЖДАЮТСЯ В НЕМЕДЛЕННОЙ МЕДИЦИНСКОЙ ПОМОЩИ.")
	spawn(214 SECONDS)
		playsound(src.loc, 'sound/misc/redalert1.ogg', 100, 1)
		ISay("|ВНИМАНИЕ| НЕМЕДЛЕННО ПРОСЛЕДУЙТЕ В БЛИЖАЙШИЕ УКРЕПЛЁННЫЕ ОТСЕКИ КОРАБЛЯ.")
	spawn(220 SECONDS)
		ISay("|ВНИМАНИЕ| ПОВТОРЯЮ, ЭТО НЕ УЧЕБНАЯ ТРЕВОГА.")
	spawn(225 SECONDS)
		ISay("|ВНИМАНИЕ| ПОВТОРЯЮ, ЭТО НЕ УЧЕБНАЯ-...")
	spawn(226 SECONDS)
		qdel(src)

/mob/living/simple_animal/holo_npc/alexey
	name = "Alexey Dostoevsky"
	desc = "Старый адмирал Экспедиционного Корпуса и последний официальный правитель ЦПСС. Похоже, он действительно был готов на всё, чтобы победить..."
	icon = 'mods/_fd/event_tools/icons/holo_npc.dmi'
	icon_state = "alexey"
	icon_living = "alexey"
	icon_dead = "alexey"

/mob/living/simple_animal/holo_npc/alexey/start_thinking()
	dir = turn(dir,-90)
	ISay("Сахароза, отчёт по ситуации.")
	forceMove(get_step(src, WEST))
	spawn(1 SECOND)
		forceMove(get_step(src, WEST))
	spawn(2 SECONDS)
		forceMove(get_step(src, WEST))
	spawn(15 SECONDS) //Спим, ждём пока Сахар ответит
		dir = turn(dir,-90)
	spawn(16 SECONDS)
		forceMove(get_step(src, NORTH))
	spawn(18 SECONDS)
		dir = turn(dir,90)
		visible_message(SPAN_NOTICE("[src] усаживается в капитанское кресло."))
	spawn(22 SECOND)
		ISay("Каков статус заряда?")
	spawn(32 SECONDS) //Ждём ответ
		ISay("Всего минута, значит...сомневаюсь, что этого будет достаточно.")
	spawn(38 SECONDS)
		ISay("Одни против двадцати четырёх. Нас должны были порвать как Тузик Грелку, и то, что этого до сих пор не произошло - УЖЕ чистая удача.")
		visible_message(SPAN_NOTICE("[src] достаёт из пальто помятую сигарету, зажимая её в зубах."))
	spawn(48 SECONDS)
		ISay("Боекомплект сдетонировал, помощи ждать не приходится. Та диона заменила собой двигатели, но этой тяги едва ли хватает на серьёзные манёвры...")
	spawn(56 SECONDS)
		ISay("...взорвём бомбу тут - не даст никакого эффекта. Они легко покинут радиус поражения.")
	spawn(60 SECONDS)
		visible_message(SPAN_NOTICE("[src] вздыхает."))
		ISay("Не стоило вам увязываться за мной. Это не должно было стать братской могилой.")
	spawn(80 SECONDS)
		visible_message(SPAN_NOTICE("[src] хмурится."))
		ISay("И тем не менее, вариантов у нас остаётся немного. Даже попытка тарана может не увеньчаться успехом.")
	spawn(84 SECONDS)
		ISay("Хм?...")
	spawn(90 SECONDS)
		ISay("И как же побег нам поможет?")
	spawn(100 SECONDS)
		ISay("Телепортировать бомбу прямо в начинку их флагмана...это полнейшее безумие. Нас просто расплющит.")
	spawn(116 SECONDS)
		visible_message(SPAN_NOTICE("[src] хватает встроенный в консоль коммуникатор."))
		ISay("Август, мне нужны твои руки у БСД. Франц, оставайся у заряда, будь готов сбрасывать его по команде.")
	spawn(122 SECONDS)
		playsound(src.loc, get_sfx("explosion"), 10, 1)
		playsound(src.loc, 'sound/effects/basscannon.ogg', 30, 1)
		ISay("Адамиди, бери остальных под своё командование - постарайтесь выиграть для нас столько времени, сколько возможно.")
	spawn(126 SECONDS)
		ISay("У нас будет ВСЕГО ОДНА попытка.")
	spawn(130 SECONDS)
		ISay("Действуй, 'Синица'.")
	spawn(182 SECONDS)
		ISay("Экипажу приготовиться! Сейчас нас нехило тряхнёт!")
	spawn(192 SECONDS)
		playsound(src.loc, get_sfx("fracture"), 50, 1)
		color = "#970000"
		alpha = 200
	spawn(193 SECONDS)
		color = COLOR_TEAL
		alpha = 150
		icon_state = "alexey_wounded"
	spawn(196 SECONDS)
		visible_message(SPAN_NOTICE("[src] пытается прокашляться, держась одной рукой за штырь в груди."))
		ISay("Сахароза...статус!-")
	spawn(200 SECONDS)
		ISay("Сахароза!...Чёрт возьми!")
	spawn(202 SECONDS)
		ISay("Дышать- не могу-")
	spawn(204 SECONDS)
		ISay("...Кто-нибудь-")
		visible_message(SPAN_NOTICE("[src] жадно глотает воздух, закатывая глаза кверху."))
		color = COLOR_DARK_BLUE_GRAY
	spawn(225 SECONDS)
		qdel(src)

/mob/living/simple_animal/holo_npc/sahar
	name = "SAHAR"
	desc = "Высокая, хорошо сложенная девушка, кажущаяся...какой-то неживой. И этот штрихкод с именем на шее?..."
	icon = 'mods/_fd/event_tools/icons/holo_npc.dmi'
	icon_state = "sahar"
	icon_living = "sahar"
	icon_dead = "sahar"

/mob/living/simple_animal/holo_npc/sahar/start_thinking()
	dir = turn(dir,-90)
	visible_message(SPAN_NOTICE("[src] быстро бегает пальцами по приборной панели."))
	spawn(5 SECONDS)
		ISay("Уровень щитов упал до 39%, системы Геркулес и Тесей выведены из строя.")
	spawn(10 SECONDS)
		ISay("Мне не хотелось бы разочаровывать вас, однако ещё одного подобного гамбита мы не переживём, господин главный командующий.")
	spawn(25 SECONDS) //Ждём, пока Достоевский сядет
		ISay("Оставшиеся юниты, Вавилон и Одиссей - уже переведены на защиту боеголовки. Капитан Минделеев практически закончил с её подготовкой.")
	spawn(30 SECONDS)
		ISay("Если очень сильно повезёт - у нас будет ещё около минуты времени.")
	spawn(61 SECONDS)
		dir = turn(dir,90)
		ISay("При всём уважении, сэр, для каждого из нас - честь оказаться с вами в бою.")
	spawn(64 SECONDS)
		ISay("Да, пускай и в заведомо проигранном - но это лучше чем просто стоять в стороне, когда на кону выживание вида.")
	spawn(70 SECONDS)
		dir = turn(dir,90)
		ISay("Позади нас - матери и будущие жёны, а также их новорождённые дети. Многие из них до сих пор не закончили эвакуацию.")
	spawn(76 SECONDS)
		ISay("И именно поэтому, нам пока рано опускать руки. Сотни людей прямо сейчас молятся за ваш успех, главнокомандующий. Включая экипаж.")
		playsound(src.loc, get_sfx("explosion"), 20, 1)
		playsound(src.loc, 'sound/effects/basscannon.ogg', 100, 1)
		visible_message(SPAN_DANGER("Голограмма мерцает, а участвующие в сцене персонажи внезапно съёживаются. Словно, произошёл какой-то взрыв."))
	spawn(82 SECONDS)
		ISay("Если мы только не попробуем кое-что.")
		visible_message(SPAN_NOTICE("[src] подняла голову, уставившись на изуродованное лицо офицера."))
	spawn(86 SECONDS)
		playsound(src.loc, get_sfx("explosion"), 10, 1)
		playsound(src.loc, 'sound/effects/basscannon.ogg', 30, 1)
		ISay("Блюспейс-прыжок.")
	spawn(94 SECONDS)
		ISay("Мы не будем бежать. Вообще-то, даже напротив, мы полетим прямо на них. Воспользовавшись 'моментумом' перемещения и прервав таковое прежде, чем тоннель стабилизируется.")
	spawn(106 SECONDS)
		ISay("И тем не менее, иных идей вы предложить сейчас не можете.")
	spawn(109 SECONDS)
		ISay("Может, игра стоит своих свеч?")
	spawn(130 SECONDS)
		visible_message(SPAN_NOTICE("[src] кивает."))
		dir = turn(dir,-90)
	spawn(132 SECONDS)
		dir = turn(dir,-90)
		visible_message(SPAN_NOTICE("[src] прикладывает руку к наушнику."))
		ISay("Господин Минделеев, вы меня слышите?")
	spawn(137 SECONDS)
		ISay("Мне нужно, чтобы вы сняли с 'синего' все предохранители.")
	spawn(144 SECONDS)
		ISay("Да, я осведомлена о возможных последствиях...да, главнокомандующий Достоевский тоже.")
	spawn(149 SECONDS)
		playsound(src.loc, get_sfx("explosion"), 10, 1)
		playsound(src.loc, 'sound/effects/basscannon.ogg', 30, 1)
		ISay("Мы сможем поговорить о сбоях в моей программе позже. Прошу, просто следуйте моим инструкциям.")
	spawn(154 SECONDS)
		ISay("Отлично, начинаем поднимать мощность. Сведите разницу двух полярностей к минимуму.")
	spawn(162 SECONDS)
		ISay("Будьте готовы 'выводить' нас сразу после ударного контакта, хорошо?")
	spawn(167 SECONDS)
		ISay("Пространственный изгиб - тридцать девять и пять десятых процентов.")
	spawn(174 SECONDS)
		visible_message(SPAN_NOTICE("[src] быстро бегает пальцами по приборной панели."))
		ISay("Сигнал пойман, сэр! Стабилизируем туннель!")
	spawn(184 SECONDS)
		ISay("Мягко сказано.")
		visible_message(SPAN_NOTICE("[src] опускает кисть на приборную панель, начиная тянуть на себя один из рычагов."))
	spawn(186 SECONDS)
		ISay("Вход в вуаль через три...")
	spawn(187 SECONDS)
		ISay("Два...")
	spawn(188 SECONDS)
		ISay("Один!")
	spawn(190 SECONDS)
		playsound(src.loc, 'sound/weapons/smash.ogg', 100, 1)
		playsound(src.loc, get_sfx("explosion"), 50, 1)
		playsound(src.loc, get_sfx("shatter"), 100, 1)
	spawn(191 SECONDS)
		ISay("Внимание! Серьёзное структурное повре-!")
		playsound(src.loc, get_sfx("sparks"), 50, 1)
		playsound(src.loc, 'sound/weapons/smash.ogg', 100, 1)
		playsound(src.loc, get_sfx("sparks"), 100, 1)
	spawn(192 SECONDS)
		playsound(src.loc, get_sfx("glasscrack"), 50, 1)
		playsound(src.loc, 'sound/items/Deconstruct.ogg', 50, 1)
		playsound(src.loc, 'sound/weapons/smash.ogg', 100, 1)
		playsound(src.loc, 'sound/weapons/smash.ogg', 100, 1)
	spawn(193 SECONDS)
		playsound(src.loc, get_sfx("explosion"), 50, 1)
		playsound(src.loc, 'sound/weapons/smash.ogg', 50, 1)
		playsound(src.loc, get_sfx("glasscrack"), 100, 1)
		playsound(src.loc, 'sound/effects/EMPulse.ogg', 100, 1)
		var/atom/target = get_edge_target_turf(src, get_dir(src, get_step_away(src, src)))
		throw_at(target, 100, 1)
		color = "#970000"
		alpha = 200
	spawn(194 SECONDS)
		color = COLOR_TEAL
		alpha = 150
		icon_state = "sahar_wounded"
		playsound(src.loc, 'sound/misc/redalert1.ogg', 100, 1)
	spawn(195 SECONDS)
		color = COLOR_DARK_BLUE_GRAY
	spawn(225 SECONDS)
		qdel(src)

/mob/living/simple_animal/holo_npc/avgust_real
	name = "Avgust Mindeleev"
	desc = "Гениальный учёный былых лет. Так значит, его последние моменты были на Факеле?.."
	icon = 'mods/_fd/event_tools/icons/holo_npc.dmi'
	icon_state = "mindeleev"
	icon_living = "mindeleev"
	icon_dead = "mindeleev"

/mob/living/simple_animal/holo_npc/avgust_real/start_thinking()
	dir = turn(dir,-90)
	ISay("Чтоб тебя черти в зад драли, Снигирь, блять!")
	visible_message(SPAN_DANGER("[src] ударяет кулаком по консоли."))
	spawn(3 SECONDS)
		ISay("Если мы ошибёмся хотя бы на одну цифру...")
	spawn(6 SECONDS)
		ISay("...страшно даже представить, что с нами станет.")
	spawn(10 SECONDS)
		ISay("Ну и кто спиздил мой оптимизм?!")
	spawn(12 SECONDS)
		ISay("Неужели мне НАСТОЛЬКО страшно?...")
	spawn(15 SECONDS)
		dir = turn(dir,90)
		visible_message(SPAN_NOTICE("[src] резко поднимает голову."))
		ISay("А? Это ещё что за шум?!")
	spawn(18 SECONDS)
		visible_message(SPAN_NOTICE("[src] опускает взгляд к экрану."))
		ISay("Нет...")
	spawn(20 SECONDS)
		ISay("...Твою же МАТЬ! НЕТ! Ну я же пошутил!")
		visible_message(SPAN_NOTICE("[src] поднимается с кресла."))
	spawn(22 SECONDS)
		ISay("Срань...что же, блять, теперь делать!...")
		visible_message(SPAN_NOTICE("[src] бегает глазами по комнате."))
		forceMove(get_step(src, SOUTH))
	spawn(28 SECONDS)
		ISay("Похе-е-ер!...")
		dir = turn(dir,-90)
		forceMove(get_step(src, WEST))
	spawn(30 SECONDS)
		ISay("Похер!")
		forceMove(get_step(src, WEST))
	spawn(32 SECONDS)
		ISay("ПОХЕР!")
		forceMove(get_step(src, WEST))
	spawn(33 SECONDS)
		ISay("Похер?...")
	spawn(35 SECONDS)
		ISay("ТЫ ЧЁ ТАМ НАКРУТИЛ?!")
	spawn(45 SECONDS)
		ISay("...дабы занизить кол-во используемой отрицательной энергии?")
	spawn(55 SECONDS)
		ISay("А сам-то знаешь!?")
	spawn(57 SECONDS)
		ISay("СУКА-")
		color = "#970000"
		alpha = 200
	spawn(58 SECONDS)
		qdel(src)

/mob/living/simple_animal/holo_npc/ai_announcer2
	name = "-SYSTEM MAINFRAME-"
	desc = "Alarm announcement system."
	icon = 'packs/infinity/icons/mob/hologram.dmi'
	icon_state = "Caution"
	icon_living = "Caution"
	icon_dead = "Caution"
	color = "#ffffff"

/mob/living/simple_animal/holo_npc/ai_announcer2/Life()
	..()

	if(!seen)
		for(var/mob/living/L in orange(10,src))
			if(L.key && L.client)
				seen = TRUE
				start_thinking()
				break

/mob/living/simple_animal/holo_npc/ai_announcer2/start_thinking()
	alpha = 0
	invisibility = 50

	spawn(10 SECOND)
		invisibility = 0
		animate(src, 5 SECONDS, alpha = 150)

	spawn(15 SECONDS)
		playsound(src.loc, 'sound/ambience/bsd_alarm.ogg', 100, 1)
		ISay("|ВНИМАНИЕ| ОБНАРУЖЕН ПЕРЕПАД ПРОСТРАНСТВЕННОЙ МАГНИТУДЫ.")
	spawn(20 SECONDS)
		ISay("|ВНИМАНИЕ| НЕМЕДЛЕННО ПОКИНЬТЕ СДЕРЖИВАЮЩУЮ КАМЕРУ.")
	spawn(25 SECONDS)
		playsound(src.loc, 'sound/ambience/bsd_alarm.ogg', 100, 1)
		ISay("|ВНИМАНИЕ| ОТКЛОНЕНИЕ НОРМАЛИ СОСТАВЛЯЕТ 12.9%")
	spawn(30 SECONDS)
		ISay("|ВНИМАНИЕ| ОТКЛОНЕНИЕ НОРМАЛИ СОСТАВЛЯЕТ 21.3%")
	spawn(35 SECONDS)
		ISay("|ВНИМАНИЕ| ОТКАЗ ЯДРА ЦЕНТРИФУГИ")
	spawn(40 SECONDS)
		ISay("|ВНИМАНИЕ| ОТКАЗ СТАБИЛИЗИРУЮЩЕГО ПОЛЯ")
	spawn(45 SECONDS)
		playsound(src.loc, 'sound/ambience/bsd_alarm.ogg', 100, 1)
		ISay("|ВНИМАНИЕ| РАССЛОЕНИЕ ПРОСТРАНСТВЕННЫХ ВЕТВЕЙ")
	spawn(50 SECONDS)
		ISay("|ВНИМАНИЕ| ОТКЛОНЕНИЕ НОРМАЛИ СОСТАВЛЯЕТ 56.4%")
	spawn(55 SECONDS)
		ISay("|ВНИМАНИЕ| НЕМЕДЛЕННО ПОКИНЬТЕ СДЕРЖИВАЮЩУЮ-")
		playsound(src.loc, 'sound/machines/BSD_explosion.ogg', 100, 1)
	spawn(58 SECONDS)
		qdel(src)

/mob/living/simple_animal/holo_npc/avgust_fantom
	name = "Avgust Mindeleev"
	desc = "Гениальный учёный былых лет. Так значит, его последние моменты были на Факеле?.."
	icon = 'mods/_fd/event_tools/icons/holo_npc.dmi'
	icon_state = "mindeleev"
	icon_living = "mindeleev"
	icon_dead = "mindeleev"

/mob/living/simple_animal/holo_npc/avgust_fantom/start_thinking()
	dir = turn(dir,180)
	ISay("Давай же, Август, ты делал это сотни раз...сможешь и в сто первый!")
	spawn(3 SECONDS)
		ISay("Ну да, тебя никогда не просили сделать вполне физическое яблоко неосязаемым, но В ТЕОРИИ же...")
	spawn(6 SECONDS)
		visible_message(SPAN_NOTICE("[src] подкручивает какую-то плату на панели перед собой."))
		ISay("...это не должно быть сложнее голограммы, верно?")
	spawn(10 SECONDS)
		visible_message(SPAN_DANGER("[src] бьёт себя по щеке."))
		ISay("Соберись, последний из Киты, что на тебя вообще нашло?")
	spawn(15 SECONDS)
		ISay("На этом корабле нет никого умнее тебя. Конечно, если из воздуха случайно не материализуется моя точная копия-я-Я-Я-Я!-")
		visible_message(SPAN_NOTICE("[src] в панике подбрасывает в воздух гаечный ключ, роняя его прямо внутрь устройства перед собой."))
	spawn(20 SECONDS)
		ISay("Бля-я-я-я-я-я...")
		visible_message(SPAN_NOTICE("[src] разворачивается к монитору оповещения, его зрачки расширились до небывалых оняме масштабов."))
	spawn(24 SECONDS)
		ISay("Я думаю, что всё ещё не настолько плохо, я могу это-")
	spawn(30 SECONDS)
		ISay("...исправить. Правда же?")
		visible_message(SPAN_NOTICE("[src] резко срывается с места, впопыхах вставая с четверенек на ноги."))
		dir = turn(dir,90)
		forceMove(get_step(src, EAST))
	spawn(32 SECONDS)
		forceMove(get_step(src, EAST))
		ISay("Блять, блять, блять, Б-Л-Я-Т-Ь!")
	spawn(33 SECONDS)
		ISay("Блять?...")
	spawn(35 SECONDS)
		dir = turn(dir,-90)
		ISay("ТЫ ЧЁ ТАМ НАКРУТИЛ?!")
	spawn(40 SECONDS)
		ISay("Занизил мощность контроллирующих полей?")
	spawn(49 SECONDS)
		ISay("Нахуя?")
	spawn(57 SECONDS)
		color = "#970000"
		alpha = 200
	spawn(58 SECONDS)
		visible_message(SPAN_WARNING("Резкая вспышка света засветила обе голограммы, расстворяя их подобно муляжу...Что это вообще было?"))
		qdel(src)

/mob/living/simple_animal/holo_npc/meat
	name = "Mr. Meat"
	desc = "Диона...в костюме? Говорящая как человек?...Впервые вижу подобное."
	icon = 'mods/_fd/event_tools/icons/holo_npc.dmi'
	icon_state = "meat"
	icon_living = "meat"
	icon_dead = "meat"

/mob/living/simple_animal/holo_npc/meat/start_thinking()
	dir = turn(dir,180)
	spawn(4 SECONDS)
		ISay("Просто хочу попрощаться с этим местом. Сам понимаешь...")
	spawn(8 SECONDS)
		ISay("...в конце концов, сложно представить, увидим ли мы его снова в принципе.")
	spawn(14 SECONDS)
		ISay("Знаешь, всю свою...жизнь...я никогда не придавал особого значению вещам вокруг.")
	spawn(20 SECONDS)
		ISay("Когда ты самолично наблюдал за падением старых и возникновением новых империй...")
	spawn(25 SECONDS)
		ISay("Восхождением тиранов, снисхождением героев...")
	spawn(28 SECONDS)
		dir = turn(dir,90)
		ISay("Тебе становится невероятно наплевать на то что ты имеешь сейчас.")
	spawn(32 SECONDS)
		ISay("Ты привыкаешь к тому, что всё что ты любишь - вероятно умрёт раньше тебя.")
		forceMove(get_step(src, WEST))
	spawn(36 SECONDS)
		ISay("Во всяком случае я так думал.")
	spawn(40 SECONDS)
		ISay("Мне было плевать на того, кто меня вырастил, плевать на людей, что затем пришли по его душу.")
	spawn(46 SECONDS)
		ISay("Было плевать, когда Смит вынес себе мозги, и плевать, когда якобы любящая меня семья погибала в ужасных муках.")
	spawn(52 SECONDS)
		visible_message(SPAN_NOTICE("[src] опускает голову."))
		ISay("Я скормил ей собственных родителей, а она об этом по итогу даже не узнала. Я мог бы вообще бросить её там...")
	spawn(58 SECONDS)
		ISay("...но не сделал этого. Всё ещё задаюсь вопросом - почему.")
	spawn(64 SECONDS)
		ISay("Она ничем не отличалась от других. Тех, кто был до, и затем после.")
	spawn(70 SECONDS)
		ISay("Я не был чем-то обязан ей или её опекунам. Она ничем не была обязана мне.")
	spawn(73 SECONDS)
		ISay("Бедняге всего-то повезло оказаться в самом защищённом месте корабля, когда случился удар.")
	spawn(77 SECONDS)
		ISay("Мне захотелось внимания? Стало интересно? Нет.")
	spawn(81 SECONDS)
		ISay("Это был мой первый момент слабости.")
	spawn(90 SECONDS)
		ISay("Слабости, за которую я до сих пор пожинаю плоды...")
	spawn(95 SECONDS)
		ISay("Теперь, когда её больше нет...я чувствую себя не просто потерянным.")
	spawn(100 SECONDS)
		ISay("Я разбит вдребезги. Мой контроль трещит по швам.")
	spawn(145 SECONDS)
		visible_message(SPAN_NOTICE("[src] молчит."))
	spawn(182 SECONDS)
		ISay("Прости, Майкл...")
	spawn(186 SECONDS)
		ISay("...но кажется я уже всё решил.")
	spawn(188 SECONDS)
		qdel(src)

/mob/living/simple_animal/holo_npc/brown
	name = "Michael Brown"
	desc = "Один из активистов, действия которого привели нас к тому, что мы имеем сегодня. Впрочем, ныне он является чуть ли не лидером человеческого сопротивления."
	icon = 'mods/_fd/event_tools/icons/holo_npc.dmi'
	icon_state = "brown"
	icon_living = "brown"
	icon_dead = "brown"

/mob/living/simple_animal/holo_npc/brown/start_thinking()
	visible_message(SPAN_NOTICE("[src] проводит рукой по панели, закрывая за собой шлюз."))
	spawn(2 SECONDS)
		dir = turn(dir,-90)
		ISay("Мясо?...")
	spawn(4 SECONDS)
		dir = turn(dir,-90)
		forceMove(get_step(src, NORTH))
	spawn(6 SECONDS)
		forceMove(get_step(src, NORTH))
	spawn(8 SECONDS)
		forceMove(get_step(src, NORTH))
		dir = turn(dir,90)
	spawn(82 SECONDS)
		visible_message(SPAN_NOTICE("[src] вздыхает."))
	spawn(98 SECONDS)
		forceMove(get_step(src, WEST))
	spawn(100 SECONDS)
		forceMove(get_step(src, WEST))
	spawn(101 SECONDS)
		visible_message(SPAN_NOTICE("[src] кладёт руку на плечо дионы."))
		ISay("Хватит.")
	spawn(104 SECONDS)
		ISay("Я не могу допустить того, что ты развалишься раньше меня, понял?")
	spawn(108 SECONDS)
		ISay("Всем сейчас нереально тяжело. И я как никто другой понимаю, что ты чувствуешь прямо сейчас.")
	spawn(114 SECONDS)
		ISay("Моя команда...нет, моя семья - была для меня буквально всем. Как Лили для тебя.")
	spawn(120 SECONDS)
		visible_message(SPAN_NOTICE("[src] отводит взгляд в сторону."))
		dir = turn(dir,90)
	spawn(123 SECONDS)
		ISay("Не стану лгать, сказав что смерть каждого бойца режет мне по шее словно нож.")
	spawn(125 SECONDS)
		ISay("Каждую. Ночь.")
	spawn(130 SECONDS)
		ISay("Я виню себя за то, что на их месте не оказался я.")
	spawn(132 SECONDS)
		ISay("Человек, куда более заслуживающий подобной участи...")
		visible_message(SPAN_DANGER("[src] сжимает металлическую руку в кулак."))
	spawn(135 SECONDS)
		ISay("Однако, задумайся о том, почему они оказались на твоём месте.")
	spawn(139 SECONDS)
		ISay("Они могли бы сбежать, как любой другой. Но отдали себя за то, чтобы ты продолжал жить.")
	spawn(144 SECONDS)
		ISay("Неужели ты думаешь, что она погибла ради того, чтобы сейчас остальные смотрели на твою кислую мину?")
		dir = turn(dir,-90)
	spawn(150 SECONDS)
		ISay("Ты нужен нам. И всегда был. Нужен мне, как друг.")
	spawn(156 SECONDS)
		ISay("Просто подумай об этом диалоге, ладно?")
	spawn(162 SECONDS)
		dir = turn(dir,90)
		ISay("Если план не поменяется, Аня и Амелия вылетят на рассвете с другими семьями.")
		forceMove(get_step(src, SOUTH))
	spawn(164 SECONDS)
		forceMove(get_step(src, SOUTH))
	spawn(166 SECONDS)
		forceMove(get_step(src, SOUTH))
	spawn(168 SECONDS)
		dir = turn(dir,90)
		ISay("Мелкая наверняка обрадуется твоей компании.")
	spawn(180 SECONDS)
		visible_message(SPAN_NOTICE("[src] закрывает за собой шлюз."))
		qdel(src)

/mob/living/simple_animal/holo_npc/pierre
	name = "Pierre Endsley"
	desc = "Какой-то крайне неудачливый парень. Его положению явно не позавидуешь..."
	icon = 'mods/_fd/event_tools/icons/holo_npc.dmi'
	icon_state = "pierre"
	icon_living = "pierre"
	icon_dead = "pierre"

/mob/living/simple_animal/holo_npc/pierre/start_thinking()
	spawn(6 SECONDS)
		ISay("Чёрт, моя голова...")
		visible_message(SPAN_NOTICE("[src], слегка придерживая голову рукой, пытается подняться на ноги."))
	spawn(8 SECONDS)
		forceMove(get_step(src, SOUTH))
	spawn(10 SECONDS)
		forceMove(get_step(src, SOUTH))
	spawn(12 SECONDS)
		forceMove(get_step(src, SOUTH))
		dir = turn(dir,90)
		visible_message(SPAN_NOTICE("[src] неохотно подбирает рацию в руки, пытаясь настроить сигнал."))
	spawn(13 SECONDS)
		ISay("Меня кто-нибудь слышит?!")
	spawn(15 SECONDS)
		ISay("Это Пьер! Что у вас происходит?!")
	spawn(17 SECONDS)
		ISay("Эй?! Долбанный металлолом!")
		visible_message(SPAN_DANGER("[src] резко бросает говорилку на пол, разворачиваясь к шлюзу."))
		dir = turn(dir,-90)
	spawn(19 SECONDS)
		forceMove(get_step(src, SOUTH))
	spawn(20 SECONDS)
		forceMove(get_step(src, SOUTH))
	spawn(22 SECONDS)
		dir = turn(dir,-90)
		visible_message(SPAN_NOTICE("[src] проводит рукой по панели управления двери."))
	spawn(25 SECONDS)
		ISay("Да быть того не может...заклинило?!")
		visible_message(SPAN_NOTICE("[src] поднимает взгляд к табло над дверью."))
	spawn(28 SECONDS)
		ISay("Ну давай же...пожалуйста!")
	spawn(30 SECONDS)
		visible_message(SPAN_DANGER("[src] хлопает по панели управления. Отказ!"))
	spawn(32 SECONDS)
		visible_message(SPAN_DANGER("[src] хлопает по панели управления. Отказ?..."))
	spawn(34 SECONDS)
		visible_message(SPAN_DANGER("[src] хлопает по панели управления. Отказ..."))
	spawn(36 SECONDS)
		visible_message(SPAN_DANGER("[src] хлопает по панели управления. И ещё один..."))
	spawn(38 SECONDS)
		visible_message(SPAN_DANGER("[src] хлопает по панели управления. И ещё..."))
		alpha = 0
	spawn(39 SECONDS)
		forceMove(get_step(src, NORTH))
		forceMove(get_step(src, NORTH))
		forceMove(get_step(src, NORTH))
		forceMove(get_step(src, NORTH))
		forceMove(get_step(src, NORTH))
		forceMove(get_step(src, EAST))
		forceMove(get_step(src, EAST))
		dir = turn(dir,180)
	spawn(42 SECONDS)
		alpha = 150
		ISay("Тут должно быть хоть что-то! Я в жизни не поверю, что они сложили сюда исключительно самые бесполезные вещи!")
	spawn(44 SECONDS)
		ISay("Канцелярия...")
	spawn(45 SECONDS)
		ISay("Пара консерв...")
	spawn(46 SECONDS)
		ISay("Отвёртка...")
	spawn(47 SECONDS)
		ISay("Коньяк...")
	spawn(49 SECONDS)
		ISay("Уж не знаю, за что судьба решила надо мной так подшутить...но владелец этого ящика явно весьма странный человек.")
	spawn(52 SECONDS)
		ISay("Впрочем, с этим...")
		dir = turn(dir,180)
		visible_message(SPAN_NOTICE("[src] поднимает ранее отброшенный инструмент, улыбнувшись."))
	spawn(54 SECONDS)
		ISay("...уже можно работать.")
	spawn(56 SECONDS)
		alpha = 0
	spawn(57 SECONDS)
		forceMove(get_step(src, NORTH))
		forceMove(get_step(src, NORTH))
		forceMove(get_step(src, NORTH))
		forceMove(get_step(src, NORTH))
		forceMove(get_step(src, WEST))
		forceMove(get_step(src, WEST))
		forceMove(get_step(src, WEST))
		dir = turn(dir,-90)
	spawn(60 SECONDS)
		alpha = 150
	spawn(65 SECONDS)
		visible_message(SPAN_NOTICE("[src] усаживается около консолей, вздыхая."))
		ISay("Итак, из новостей.")
	spawn(70 SECONDS)
		ISay("Во-первых, как вы можете слышать прямо сейчас...наверное- мой голос оказывается всё это время записывался. Да и не только он.")
	spawn(74 SECONDS)
		ISay("Стоило, наверное, предположить подобное сразу. В конце концов, кажется, на Факеле подобная система стояла и раньше?...")
	spawn(79 SECONDS)
		ISay("Грех, если честно, жаловаться. Так, по-крайней мере, у меня будет возможность поболтать с воображаемым другом, а не только голосами в голове.")
	spawn(86 SECONDS)
		ISay("Во-вторых...все остальные мертвы. По разным причинам. А Мясо, кажется, вошёл во что-то вроде зимней спячки.")
	spawn(92 SECONDS)
		ISay("Меня же, тем временем, выбросило в долбанный открытый космос. Точных данных я очевидно назвать не смогу - но без скафандра тут не пробежишься..")
	spawn(98 SECONDS)
		ISay("Скафандра у меня кстати, тоже нет. Да даже маски кислородной...")
	spawn(104 SECONDS)
		ISay("И я действительно помню некий хлопок, да только...он, что, изнутри произошёл?")
	spawn(107 SECONDS)
		ISay("Или канонерка была закреплена настолько ПЛОХО, что её буквально сорвало?")
	spawn(110 SECONDS)
		ISay("Фиолетовых поблизости нет - и на том спасибо. Видимо, искать нас они даже не собираются. Много чести.")
	spawn(114 SECONDS)
		ISay("А кому ещё, кроме них, мы вообще нужны?...")
	spawn(118 SECONDS)
		ISay("Я пытался дистанционно подключиться к сенсорам корабля, но они, видно, либо отмерли, либо я слишком плох.")
	spawn(122 SECONDS)
		ISay("Больше склоняюсь ко второму. Пытаться переоборудовать консоль управления орудием под что-то другое - та ещё задачка.")
	spawn(126 SECONDS)
		ISay("В хранилище боеприпасов, ещё, нашёл планшет. С ним всё оказалось немного проще, да и старые охранные коды я тоже помню...")
	spawn(130 SECONDS)
		ISay("...так что теперь у меня есть доступ к последним двадцати четырём часам этой посудины.")
	spawn(135 SECONDS)
		ISay("От скуки я даже начал конспектировать, как и в каком порядке матушка-смерть забирала несчастных.")
	spawn(138 SECONDS)
		ISay("Я увидел как умирает адмирал, следил за последними секундами Минделеева, и даже видел, как Адамиди в одиночку, практически голыми руками - отправляет двух Алатов обратно к чёрту на куличиках.")
	spawn(148 SECONDS)
		ISay("Но меня среди них нет.")
	spawn(152 SECONDS)
		alpha = 0
	spawn(153 SECONDS)
		forceMove(get_step(src, EAST))
		forceMove(get_step(src, NORTH))
		forceMove(get_step(src, NORTH))
		forceMove(get_step(src, NORTH))
		forceMove(get_step(src, WEST))
		dir = turn(dir,90)
	spawn(160 SECONDS)
		alpha = 150
	spawn(164 SECONDS)
		ISay("Терпеть не могу консервы...хотя, большая часть еды на Земле только так и продаётся.")
	spawn(168 SECONDS)
		ISay("Про Марс вообще молчу...")
	spawn(176 SECONDS)
		ISay("Я торчу тут уже неделю, кажется.")
	spawn(180 SECONDS)
		ISay("И совсем не могу отделаться от этого странного...чувства. Каждый раз, засыпая, я слышу их голоса.")
	spawn(184 SECONDS)
		ISay("Они упрекают меня в моей бесхребетности и никчёмности. Мол, я самый настоящий счастливчик...")
	spawn(190 SECONDS)
		ISay("Однако по моему скромному мнению - это чистилище. Моё. Личное.")
	spawn(195 SECONDS)
		ISay("И нахождение в нём особого счастья не приносит. Я, будто бы...")
	spawn(200 SECONDS)
		ISay("...ещё не до конца определился - уйти естественным путём, или с огоньком.")
	spawn(210 SECONDS)
		ISay("Я пересмотрел этот бой раз сто точно. Зарисовал некоторые моменты. Каждый отдал своё всё ради этой горе-победы.")
	spawn(217 SECONDS)
		ISay("Об их кончине сложат легенды, которые затем будут передаваться целыми поколениями.")
	spawn(222 SECONDS)
		ISay("А обо мне ничего не напишут. Просто потому что от меня останется лишь хладный труп и ведро с отходами жизнедеятельности.")
	spawn(226 SECONDS)
		ISay("Ну, как-то вот так оно и получается.")
	spawn(230 SECONDS)
		ISay("Хотел, значит, умереть по-геройски...сына спасти. Теперь каждая моя бессонная ночь сопровождается мыслями о нём.")
	spawn(238 SECONDS)
		ISay("Места себе не нахожу думая о том, как он сейчас...")
	spawn(244 SECONDS)
		ISay("Надеюсь, они выбрались. Мартин, может, местами и придурок, но я верю в него.")
	spawn(248 SECONDS)
		ISay("Всегда верил.")
	spawn(254 SECONDS)
		ISay("Может, он даже станет для него отцом получше меня самого.")
		visible_message(SPAN_NOTICE("[src] вздыхает."))
	spawn(263 SECONDS)
		ISay("Я скучаю.")
	spawn(266 SECONDS)
		alpha = 0
	spawn(267 SECONDS)
		forceMove(get_step(src, EAST))
		forceMove(get_step(src, EAST))
		forceMove(get_step(src, NORTH))
	spawn(278 SECONDS)
		alpha = 150
		ISay("Еда кончилась два дня назад. Воздуха у меня осталось где-то на тринадцать часов.")
	spawn(284 SECONDS)
		ISay("Дышать всё тяжелее...")
	spawn(286 SECONDS)
		ISay("Я выдышал все баллоны, что только нашёл. Но головная боль всё никак не проходит.")
	spawn(295 SECONDS)
		ISay("Рисую, чтобы хоть как-то отвлечься. Выходит паршиво.")
	spawn(302 SECONDS)
		ISay("Чистых листов почти не осталось. Решил, вот, потратить время с пользой, знаете ли.")
	spawn(306 SECONDS)
		ISay("Написал для него пособие. Основанное на моих собственных ошибках.")
	spawn(310 SECONDS)
		ISay("Крайне сомневаюсь, впрочем, что оно когда-либо в принципе попадёт к нему в руки.")
		visible_message(SPAN_NOTICE("[src] быстро водит ручкой по тетради."))
	spawn(316 SECONDS)
		ISay("Мне казалось, что я уже смирился со своим очевидным концом. Но почему-то меня всё-равно бросает в дрожь.")
	spawn(321 SECONDS)
		ISay("Даже не из-за того, что меня скоро не станет...а из-за того что я прекрасно понимаю...")
	spawn(330 SECONDS)
		ISay("...Я - это всё, что у меня есть. Как только Я умру - мне будет больше нечего оставить остальному миру.")
	spawn(332 SECONDS)
		alpha = 0
	spawn(340 SECONDS)
		visible_message(SPAN_DANGER("Кто-то очень тяжело дышит...голограмма то и дело начинает глючить."))
	spawn(342 SECONDS)
		alpha = 150
		ISay("Перси.")
	spawn(346 SECONDS)
		ISay("Я знаю, что ты прямо сейчас слышишь меня. Чувствую это. Тут.")
		visible_message(SPAN_NOTICE("[src] тычет пальцем в висок."))
	spawn(348 SECONDS)
		ISay("В голове.")
	spawn(352 SECONDS)
		visible_message(SPAN_NOTICE("[src] запрокидывает голову, шмыгая носом. На голограмме едва заметно, как из него пошла струйка чего-то чёрного."))
	spawn(356 SECONDS)
		ISay("Сделай...своему папе одолжение, ладно?")
	spawn(358 SECONDS)
		ISay("Живи.")
	spawn(361 SECONDS)
		ISay("Живи ради памяти. Не обо мне. Не о ком-либо ещё - о себе.")
	spawn(365 SECONDS)
		ISay("К чёрту эти звёзды и 'выше'. Нет там ничего...пустой Олимп.")
		visible_message(SPAN_DANGER("[src] харкается кровью."))
	spawn(370 SECONDS)
		ISay("Не будь...идиотом...-")
	spawn(373 SECONDS)
		ISay("Гоняющимся за молнией...")
	spawn(376 SECONDS)
		ISay("...всё равно не поймаешь.")
	spawn(377 SECONDS)
		color = COLOR_DARK_BLUE_GRAY
	spawn(379 SECONDS)
		qdel(src)

/mob/living/simple_animal/holo_npc/radio
	name = "radio"
	desc = "Simple shortwave radio."
	icon = 'icons/obj/machines/radio.dmi'
	icon_state = "walkietalkie"
	icon_living = "walkietalkie"
	icon_dead = "walkietalkie"

/mob/living/simple_animal/holo_npc/radio/start_thinking()
	spawn(4 SECONDS)
		ISay("КТО-НИБУДЬ! *?;9ЗОВ_)йЕСЬ!")
	spawn(8 SECONDS)
		ISay("РУЗВЕЛ?%Т В КРИТ)*(%*1М! ВРАЧА СЮДА, %*()658!")
	spawn(12 SECONDS)
		ISay("КАКОГО НАХУЙ В*%?t*&*7R?! ТЫ ВИДИШЬ ХОТЬ КОГО-ТО, КТО ЕЩЁ OIt68 *&guienaUI GUI8&T?87Н?Е?")
	spawn(14 SECONDS)
		ISay("АААА-А-А-А! А-А-А, БЛЯТЬ! А-А-(*^*%vyes)Ы-Ы-Ы(&(*::*?*?*87))! Ы-ЫЫ-Ы-")
	spawn(16 SECONDS)
		ISay("ТРЕТЬЯ ПАЛУБА, ДЖИММИ ПРОТКНУЛО ГРУДЬ (?$#!@)МКОМ!")
	spawn(20 SECONDS)
		ISay("БОМБА! КТО-НИБУДЬ, СКАЖИТЕ ЧТО С БОМБОЙ?!")
	spawn(24 SECONDS)
		ISay("У НАС П*!!@&#ОСЬ?!...АВГУСТ1!")
	spawn(38 SECONDS)
		qdel(src)

// Шаблоны, чтобы билд компилился

/mob/living/simple_animal/holo_npc/danil

/mob/living/simple_animal/holo_npc/brown2

/mob/living/simple_animal/holo_npc/meat2
