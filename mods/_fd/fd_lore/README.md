
#### Список PRов:

- https://github.com/RepoStash/FD-NewBay/pull/46
<!--
  Ссылки на PRы, связанные с модом:
  - Создание
  - Большие изменения
-->

<!-- Название мода. Не важно на русском или на английском. -->
## Мод-пример

ID мода: FD_LORE
<!--
  Название модпака прописными буквами, СОЕДИНЁННЫМИ_ПОДЧЁРКИВАНИЕМ,
  которое ты будешь использовать для обозначения файлов.
-->

### Описание мода

Это мод, содержащий все правки относительно Лора ФД. Не путать с FD-Species, что затрагивает только Расы.
<!--
  Что он делает, что добавляет: что, куда, зачем и почему - всё здесь.
  А также любая полезная информация.
-->

### Изменения *кор кода*

- `/datum/antagonist/foundation`: `proc/equip(mob/living/carbon/human/player)`,
<!--
  Если вы редактировали какие-либо процедуры или переменные в кор коде,
  они должны быть указаны здесь.
  Нужно указать и файл, и процедуры/переменные.

  Изменений нет - напиши "Отсутствуют"
-->

### Оверрайды

- `/singleton/hierarchy/outfit/foundation`: `var/name`
- `/obj/item/card/id/foundation`: `var/name`
- `/obj/item/device/radio/headset/foundation`: `var/name`
- `/obj/item/clothing/suit/storage/toggle/labcoat/foundation`: `var/name`, `var/desc`
- `/datum/codex_entry/cuchulain_foundation`: `var/display_name`, `var/associated_strings`, `var/lore_text`, `var/antag_text`
- `/datum/codex_entry/psionics`: `var/lore_text`
- `/obj/item/reagent_containers/food/drinks/glass2/coffeecup/foundation`: `var/name`, `var/desc`, `var/base_name`
- `/obj/item/gun/projectile/revolver/foundation`: `var/name`, `var/desc`
- `/obj/item/storage/briefcase/foundation`: `var/name`
- `/obj/item/book/manual/psionics`: `var/dat`

- `psistuff.dm`
  - `/obj/item/nullrod/apply_hit_effect(mob/living/target, mob/living/user, hit_zone)`
<!--
  Если ты добавлял новый модульный оверрайд, его нужно указать здесь.
  Здесь указываются оверрайды в твоём моде и папке `_master_files`

  Изменений нет - напиши "Отсутствуют"
-->

### Дефайны

- Отсутствуют
<!--
  Если требовалось добавить какие-либо дефайны, укажи файлы,
  в которые ты их добавил, а также перечисли имена.
  И то же самое, если ты используешь дефайны, определённые другим модом.

  Не используешь - напиши "Отсутствуют"
-->

### Используемые файлы, не содержащиеся в модпаке

- Отсутствуют
<!--
  Будь то немодульный файл или модульный файл, который не содержится в папке,
  принадлежащей этому конкретному моду, он должен быть упомянут здесь.
  Хорошими примерами являются иконки или звуки, которые используются одновременно
  несколькими модулями, или что-либо подобное.
-->

### Авторы:

Chaplain Maximum
<!--
  Здесь находится твой никнейм
  Если работал совместно - никнеймы тех, кто помогал.
  В случае порта чего-либо должна быть ссылка на источник.
-->
