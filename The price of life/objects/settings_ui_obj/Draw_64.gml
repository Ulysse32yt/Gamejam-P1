var _gui_w = display_get_gui_width()
var _gui_h = display_get_gui_height()
var _gui_mx = device_mouse_x_to_gui(0)
var _gui_my = device_mouse_y_to_gui(0)

// Titre
draw_set_halign(fa_center)
draw_set_color(c_yellow)
draw_text_transformed(_gui_w/2, 40, "SETTINGS", 2, 2, 0)

// Slider volume
var _slider_x = _gui_w/2 - 150
var _slider_y = _gui_h/2
var _slider_w = 300
var _slider_h = 10

// Fond du slider
draw_set_color(make_color_rgb(80, 80, 80))
draw_rectangle(_slider_x, _slider_y, _slider_x + _slider_w, _slider_y + _slider_h, false)

// Partie remplie
draw_set_color(c_yellow)
draw_rectangle(_slider_x, _slider_y, _slider_x + (_slider_w * volume), _slider_y + _slider_h, false)

// Curseur
var _cursor_x = _slider_x + (_slider_w * volume)
draw_set_color(c_white)
draw_circle(_cursor_x, _slider_y + _slider_h/2, 12, false)

// Label
draw_set_halign(fa_center)
draw_set_color(c_white)
draw_set_font(-1)
draw_text(_gui_w/2, _slider_y - 30, "Volume : " + string(round(volume * 100)) + "%")

// Bouton Retour
var _btn_w = 160
var _btn_h = 50
var _btn_x = 30
var _btn_y = _gui_h - 80
var _hover = point_in_rectangle(_gui_mx, _gui_my, _btn_x, _btn_y, _btn_x + _btn_w, _btn_y + _btn_h)
draw_set_color(_hover ? c_yellow : make_color_rgb(40, 40, 40))
draw_rectangle(_btn_x, _btn_y, _btn_x + _btn_w, _btn_y + _btn_h, false)
draw_set_color(_hover ? c_black : c_white)
draw_rectangle(_btn_x, _btn_y, _btn_x + _btn_w, _btn_y + _btn_h, true)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_color(_hover ? c_black : c_white)
draw_text(_btn_x + _btn_w/2, _btn_y + _btn_h/2, "< Retour")
draw_set_valign(fa_top)