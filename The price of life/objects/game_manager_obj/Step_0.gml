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
    if (wave_clear_timer >= 180) {
        wave_clear_timer = 0
        wave++
        mobs_per_wave = 1 + wave * 2
        start_next_wave()
    }
}
if (instance_exists(player_obj)) {
    if (mouse_check_button_pressed(mb_left)) {
        var _gui_mx  = device_mouse_x_to_gui(0);
        var _gui_my  = device_mouse_y_to_gui(0);
        var _gui_w   = camera_get_view_width(view_camera[0]);
        var _gui_h   = camera_get_view_height(view_camera[0]);
        var _costs   = [0, 5, 10, 20];
        var _card_w  = 120;
        var _card_h  = 70;
        var _gap     = 10;
        var _total   = (_card_w * 4) + (_gap * 3);
        var _start_x = (_gui_w - _total) / 2;
        var _y       = _gui_h - _card_h - 10;
        
        for (var i = 1; i < 4; i++) {
            var _x = _start_x + i * (_card_w + _gap);
            
            if (point_in_rectangle(_gui_mx, _gui_my, _x, _y, _x + _card_w, _y + _card_h)) {
                var _is_unlocked = player_obj.weapons_unlocked[$ string(i + 1)];
                
                if (!_is_unlocked && gold >= _costs[i]) {
                    gold -= _costs[i];
                    player_obj.weapons_unlocked[$ string(i + 1)] = true;
                    
                    var _wnames = ["", "Axe", "Rifle", "Machine Gun"];
                    draw_event_cooldown = 120;
                    event_text = _wnames[i] + " unlocked!";
                }
            }
        }
    }
}
if draw_event_cooldown > 0 {
    draw_event_cooldown -= 1
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

// Clic bouton Settings
if (!game_over && mouse_check_button_released(mb_left)) {
    var _gui_mx = device_mouse_x_to_gui(0)
    var _gui_my = device_mouse_y_to_gui(0)
    var _sbtn_w = 120
    var _sbtn_h = 40
    var _sbtn_x = display_get_gui_width() - _sbtn_w - 20
    var _sbtn_y = 20
    if point_in_rectangle(_gui_mx, _gui_my, _sbtn_x, _sbtn_y, _sbtn_x + _sbtn_w, _sbtn_y + _sbtn_h) {
        room_goto(Settings)
    }
}