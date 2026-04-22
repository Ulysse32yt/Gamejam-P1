if mouse_check_button_released(mb_left) {
	var _btn_y = display_get_gui_height() - 80
	var _gui_mx = device_mouse_x_to_gui(0)
	var _gui_my = device_mouse_y_to_gui(0)
	var _gui_w  = display_get_gui_width()
	var _gui_h  = display_get_gui_height()
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

	if point_in_rectangle(_gui_mx, _gui_my, _btn_x, _btn_y, _btn_x + _btn_w, _btn_y + _btn_h) {
		save_data()
		room_goto(MainMenu)
		exit
	}

	for (var i = 0; i < 4; i++) {
		var _x = _start_x + i * (_card_w + _gap)
    
		if point_in_rectangle(_gui_mx, _gui_my, _x, _y, _x + _card_w, _y + _card_h) {
			var _lvls = [global.lvl_hp, global.lvl_damage, global.lvl_max_energy, global.lvl_energy_recup]
			var _cost = _shop.get_cost(_lvls[i])
        
			if (global.xp >= _cost) {
				global.xp -= _cost
            
				switch(i) {
					case 0: global.lvl_hp++;    break
					case 1: global.lvl_damage++;      break
					case 2: global.lvl_max_energy++;  break
					case 3: global.lvl_energy_recup++; break
				}
			}
		}
	}
}