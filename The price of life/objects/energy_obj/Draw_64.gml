draw_sprite(energy_sprite, 0, 0, 128)

draw_set_colour(c_black)
draw_rectangle(10, 300, 40, 300+400*(1-energy/max_energy), false)

draw_set_colour(c_yellow)
draw_rectangle(10, 300+400*(1-energy/max_energy), 40, 700, false)

draw_set_colour(c_white)
draw_rectangle(10, 300, 40, 700, true)