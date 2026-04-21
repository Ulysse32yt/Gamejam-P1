// Compte les mobs encore en vie
mobs_remaining = instance_number(mob_obj)

// Spawn progressif des mobs
if (mobs_to_spawn > 0) {
    spawn_timer--
    if (spawn_timer <= 0) {
        spawn_mob()
        mobs_to_spawn--
        spawn_timer = spawn_delay
    }
}

// Vague terminée quand plus aucun mob en vie et plus rien à spawner
if (mobs_to_spawn == 0 && mobs_remaining == 0 && wave_started) {
    wave_clear_timer++
    if (wave_clear_timer >= 180) { // 3 secondes de pause
        wave_clear_timer = 0
        wave++
        mobs_per_wave = 3 + (wave * 2) // +2 mobs par vague
        start_next_wave()
    }
}

if (game_over) {
    if (mouse_check_button_pressed(mb_any)) {
        game_over = false
        room_goto(MainMenu)
		transition_controller_obj.transition = 0
    }
}