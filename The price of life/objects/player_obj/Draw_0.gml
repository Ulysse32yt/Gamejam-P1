draw_self()

_bar_x = x - 36
_bar_y = y - 50 - _bar_height*2 

draw_set_color(c_red)
draw_rectangle(_bar_x, _bar_y, _bar_x + _bar_width, _bar_y + _bar_height, false)

draw_set_color(c_blue)
draw_rectangle(_bar_x, _bar_y, _bar_x + (_bar_width * hp / hp_max), _bar_y + _bar_height, false)

draw_set_color(c_white)