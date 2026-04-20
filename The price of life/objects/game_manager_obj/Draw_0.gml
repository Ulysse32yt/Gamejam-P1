draw_set_font(-1);
draw_set_halign(fa_left);
draw_set_color(c_white);

// Vague actuelle
draw_text(20, 20, "Vague : " + string(wave));

// Mobs restants
draw_text(20, 45, "Mobs : " + string(mobs_remaining + mobs_to_spawn));

// Annonce entre les vagues
if (mobs_to_spawn == 0 && mobs_remaining == 0 && wave_started) {
    draw_set_halign(fa_center);
    draw_set_color(c_yellow);
    var _next = wave + 1;
    draw_text(display_get_gui_width() / 2, display_get_gui_height() / 2, 
              "VAGUE " + string(_next) + " EN APPROCHE !");
}