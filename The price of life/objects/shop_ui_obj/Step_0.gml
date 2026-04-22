if mouse_check_button_released(mb_left) {
	var _btn_y = display_get_gui_height() - 80
	var _gui_mx = device_mouse_x_to_gui(0)
	var _gui_my = device_mouse_y_to_gui(0)
	var _gui_w  = display_get_gui_width()
	var _gui_h  = display_get_gui_height()
	
	// S'assurer que le shop_manager_obj existe et que les améliorations sont chargées
	if (!instance_exists(shop_manager_obj)) {
		show_debug_message("Shop manager not found, cannot process clicks");
		return;
	}
	
	// Attendre un peu que les améliorations se chargent
	if (!global.upgrades_loaded) {
		show_debug_message("Upgrades not loaded yet, cannot process clicks");
		return;
	}
	
	// S'assurer que les données d'améliorations sont bien initialisées
	if (!global.upgrades_loaded || !global.upgrade_data) {
		show_debug_message("Upgrade data not initialized yet, cannot process clicks");
		return;
	}
	
	var _shop   = shop_manager_obj
	var _xp     = xp_obj

	var _card_w = 250
	var _card_h = 160
	var _gap    = 30
	var _total  = (_card_w * 4) + (_gap * 3)
	var _start_x = (_gui_w - _total) / 2
	var _y = _gui_h / 2 - _card_h / 2

	var _btn_w = 160
	var _btn_h = 50
	var _btn_x = 30
	var _btn_y = display_get_gui_height() - 80

	if point_in_rectangle(_gui_mx, _gui_my, _btn_x, _btn_y, _btn_x + _btn_w, _btn_y + _btn_h) {
		// Sauvegarder toutes les données avant de retourner au menu
		if (instance_exists(xp_obj)) {
			xp_obj.save_player_data();
			show_debug_message("Game data saved before returning to menu from shop");
		}
		if (global.upgrades_loaded && instance_exists(_shop)) {
			_shop.save_upgrades();
			show_debug_message("Upgrades saved before returning to menu from shop");
		}
		
		room_goto(MainMenu)
		exit
	}

	for (var i = 0; i < 4; i++) {
		var _x = _start_x + i * (_card_w + _gap)
    
		if point_in_rectangle(_gui_mx, _gui_my, _x, _y, _x + _card_w, _y + _card_h) {
			// Debug: afficher quel carte est cliquée
			show_debug_message("Clicked on upgrade card: " + string(i));
			
			// Vérifier que le shop et les données sont chargés
			if (!instance_exists(_shop)) {
				show_debug_message("Shop manager not found!");
				continue;
			}
			
			if (!global.upgrades_loaded) {
				show_debug_message("Upgrades not loaded!");
				continue;
			}
			
			// Utiliser le nouveau système JSON
			var _upgrade_ids = ["lifetime", "damage", "max_energy", "energy_recovery"];
			var _cost = _shop.get_upgrade_cost(_upgrade_ids[i]);
			var _player_xp = instance_exists(xp_obj) ? xp_obj.xp : 0;
			
			// Vérifier si le niveau maximum est atteint
			var _upgrade = _shop.find_upgrade_by_id(_upgrade_ids[i]);
			var _is_max_level = (_upgrade && _upgrade.niveau_actuel >= 20);
			
			show_debug_message("Upgrade: " + _upgrade_ids[i] + ", Cost: " + string(_cost) + ", Player XP: " + string(_player_xp) + ", Max Level: " + string(_is_max_level));
        
			if (!_is_max_level && _player_xp >= _cost) {
				_shop.buy_upgrade(_upgrade_ids[i]);
				if (instance_exists(xp_obj)) {
					xp_obj.save_player_data();
				}
				if (instance_exists(_shop)) {
					_shop.save_upgrades();
				}
			} else {
				show_debug_message("Cannot purchase upgrade: " + _upgrade_ids[i]);
			}
		}
	}
}