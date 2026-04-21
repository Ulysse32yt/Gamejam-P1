var _gui_w = display_get_gui_width()
var _gui_h = display_get_gui_height()

draw_set_font(-1)
draw_set_color(c_white)

// Vague en haut à gauche
draw_set_halign(fa_left)
draw_text(20, 20, "Vague : " + string(wave))
draw_text(20, 45, "Mobs : " + string(mobs_remaining + mobs_to_spawn))

// Annonce entre les vagues (centre de l'écran)
if (mobs_to_spawn == 0 && mobs_remaining == 0 && wave_started) {
    draw_set_halign(fa_center)
    draw_set_color(c_yellow)
    draw_text_transformed(
        _gui_w / 2, 
        _gui_h / 2, 
        "VAGUE " + string(wave + 1) + " EN APPROCHE !", 
        2, 2, 0  // Taille x2
    )
}

draw_set_color(c_white)
draw_set_halign(fa_left)