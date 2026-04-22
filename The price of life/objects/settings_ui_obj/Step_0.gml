var _gui_mx = device_mouse_x_to_gui(0)
var _gui_my = device_mouse_y_to_gui(0)
var _gui_w  = display_get_gui_width()
var _gui_h  = display_get_gui_height()

// Slider
var _slider_x = _gui_w/2 - 150
var _slider_y = _gui_h/2
var _slider_w = 300
var _slider_h = 10

// Début du drag
if mouse_check_button_pressed(mb_left) {
    if point_in_rectangle(_gui_mx, _gui_my, _slider_x - 12, _slider_y - 12, _slider_x + _slider_w + 12, _slider_y + _slider_h + 12) {
        dragging = true
    }
}

// Pendant le drag
if dragging && mouse_check_button(mb_left) {
    global.volume = clamp((_gui_mx - _slider_x) / _slider_w, 0, 1)
    audio_master_gain(global.volume)
}

// Fin du drag
if mouse_check_button_released(mb_left) {
    dragging = false
    
    // Bouton Retour
    var _btn_w = 160
    var _btn_h = 50
    var _btn_x = 30
    var _btn_y = _gui_h - 80
    if point_in_rectangle(_gui_mx, _gui_my, _btn_x, _btn_y, _btn_x + _btn_w, _btn_y + _btn_h) {
        save_data()
		room_goto(MainMenu)
    }
	
	// Bouton reset
	var _button_reset_w = 160
	var _button_reset_h = 50
	var _button_reset_x = _gui_w - 30 - _button_reset_w
	var _button_reset_y = _gui_h - 80
	if point_in_rectangle(_gui_mx, _gui_my, _button_reset_x, _button_reset_y, _button_reset_x+_button_reset_w, _button_reset_y+_button_reset_h) {
		reset_data()
		save_data()
		room_goto(lore)
	}
}