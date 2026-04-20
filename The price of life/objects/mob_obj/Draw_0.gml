draw_self()

_bar_x = x + _bar_width / 4
_bar_y = y - _bar_height*2 

draw_set_color(c_red)
draw_rectangle(_bar_x, _bar_y, _bar_x + _bar_width, _bar_y + _bar_height, false)

draw_set_color(c_green)
draw_rectangle(_bar_x, _bar_y, _bar_x + (_bar_width * hp / hp_max), _bar_y + _bar_height, false)

draw_set_color(c_white)