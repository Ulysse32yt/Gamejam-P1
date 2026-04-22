if mouse_check_button_released(mb_left) {
    var _gui_mx = device_mouse_x_to_gui(0)
    var _gui_my = device_mouse_y_to_gui(0)
    var _gui_h  = display_get_gui_height()

    var _btn_w = 160
    var _btn_h = 50
    var _btn_x = 30
    var _btn_y = _gui_h - 80

    if point_in_rectangle(_gui_mx, _gui_my, _btn_x, _btn_y, _btn_x + _btn_w, _btn_y + _btn_h) {
        room_goto(MainMenu)
    }
}