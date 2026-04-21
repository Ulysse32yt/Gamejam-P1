draw_self();

draw_set_font(button_font)
draw_set_color(make_color_rgb(255, 200, 50));

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

cx = x + texture_get_width(button_spr) / 2;
cy = y +  texture_get_width(button_spr) / 2;


draw_text(cx, cy, action)