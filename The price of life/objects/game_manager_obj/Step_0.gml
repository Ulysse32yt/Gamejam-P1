// Compte les mobs encore en vie
mobs_remaining = instance_number(mob_obj) + instance_number(sentinel_obj)

// Spawn progressif des mobs
if (mobs_to_spawn > 0) {
    spawn_timer--
    if (spawn_timer <= 0) {
		if wave >= 4 {
			if counter_mobs_before_sentinel < nb_mobs_before_sentinel {
				spawn_mob()
				counter_mobs_before_sentinel += 1
			} else {
				spawn_sentinel()
				counter_mobs_before_sentinel = 0	
			}
		} else {
			spawn_mob()
		}
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
		mobs_per_wave = 1 + wave * 2
        start_next_wave()
    }
}

if (game_over) {
	if (!xp_given) {
        var _xp_gain = floor(1 + (wave * (wave + 1)) / 2)
        with (xp_obj) {
            xp += _xp_gain
        }
        xp_given = true
    }
	
    if (mouse_check_button_pressed(mb_any)) {
        game_over = false
		xp_given = false
        
        // Sauvegarder toutes les données avant de retourner au menu
        if (instance_exists(xp_obj)) {
            xp_obj.save_player_data();
            show_debug_message("Game data saved before returning to menu");
        }
        if (variable_global_exists("upgrades_loaded") && global.upgrades_loaded && instance_exists(shop_manager_obj)) {
            shop_manager_obj.save_upgrades();
            show_debug_message("Upgrades saved before returning to menu");
        }
        
        room_goto(MainMenu)
		var controller = instance_exists(transition_controller_obj) ? instance_find(transition_controller_obj, 0) : noone;
		if (controller != noone) {
			controller.transition = 0;
		}
    }
}