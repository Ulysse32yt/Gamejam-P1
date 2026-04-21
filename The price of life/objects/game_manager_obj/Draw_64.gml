var _gui_w = display_get_gui_width()
var _gui_h = display_get_gui_height()

draw_set_font(-1)
draw_set_color(c_white)

// Vague en haut à gauche
draw_set_halign(fa_left)
draw_text(20, 20, "Vague : " + string(wave))
draw_text(20, 45, "Mobs : " + string(mobs_remaining + mobs_to_spawn))
draw_text(20, 70, "Gold : " + string(gold))

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

if (game_over) {
    var _gui_w = camera_get_view_width(view_camera[0]);
    var _gui_h = camera_get_view_height(view_camera[0]);
    
    // Fond semi-transparent noir
    draw_set_alpha(0.6);
    draw_set_color(c_black);
    draw_rectangle(0, 0, _gui_w, _gui_h, false);
    draw_set_alpha(1);
    
    // Titre "Défaite"
    draw_set_halign(fa_center);
    draw_set_color(c_red);
    draw_text_transformed(_gui_w / 2, _gui_h / 2 - 60, "DÉFAITE", 3, 3, 0);
    
    // Sous-titre
    draw_set_color(c_white);
    draw_text_transformed(_gui_w / 2, _gui_h / 2 + 10, "Tu es mort par un monstre", 1.5, 1.5, 0);
    
    // Instruction
    draw_set_color(c_ltgray);
    draw_text_transformed(_gui_w / 2, _gui_h / 2 + 60, "Cliquer pour revenir au menu", 1, 1, 0);
    
    draw_set_halign(fa_left);
}