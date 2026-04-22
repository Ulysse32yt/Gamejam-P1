var camera_x = camera_get_view_x(view_camera[0]);
var camera_y = camera_get_view_y(view_camera[0]);

draw_sprite_ext(
energy_spr,
0,
camera_x,
camera_y + 128,
2,
2,
0,
c_white,
1
)

draw_set_colour(c_black);
draw_rectangle(camera_x + 10, camera_y + 300, camera_x + 40, camera_y + 300+400*(1-energy/max_energy), false);

draw_set_colour(c_yellow);
draw_rectangle(camera_x + 10, camera_y + 300+400*(1-energy/max_energy), camera_x + 40, camera_y + 700, false);

draw_set_colour(c_white);
draw_rectangle(camera_x + 10, camera_y + 300, camera_x + 40, camera_y + 700, true);