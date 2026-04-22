var _gui_w = display_get_gui_width()
var _gui_h = display_get_gui_height()

draw_set_font(defaite_font)
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


if draw_event_cooldown > 0 {
	draw_set_font(button_font)
	draw_text(display_get_gui_width()/2 - string_width(event_text)/2, 10, event_text)
}

if (game_over) {
    _gui_w = camera_get_view_width(view_camera[0]);
    _gui_h = camera_get_view_height(view_camera[0]);
    
    // Fond semi-transparent noir
    draw_set_alpha(0.6);
    draw_set_color(c_black);
    draw_rectangle(0, 0, _gui_w, _gui_h, false);
    draw_set_alpha(1);
    
    // Titre "Défaite"
    draw_set_halign(fa_center);
    draw_set_color(c_red);
    draw_text_transformed(_gui_w / 2, _gui_h / 2 - 60, "DEFAITE", 3, 3, 0);
    
    // Sous-titre
    draw_set_color(c_white);
    draw_text_transformed(_gui_w / 2, _gui_h / 2 + 10, "Tu es mort par un monstre", 1.5, 1.5, 0);
    
    // Instruction
    draw_set_color(c_ltgray);
    draw_text_transformed(_gui_w / 2, _gui_h / 2 + 60, "Cliquer pour revenir au menu", 1, 1, 0);
    
    draw_set_halign(fa_left);
}

if (instance_exists(player_obj)) {
    var _gui_w = camera_get_view_width(view_camera[0]);
    var _gui_h = camera_get_view_height(view_camera[0]);
    
    var _names   = ["Sword", "Axe", "Rifle", "Machine Gun"];
    var _costs   = [0, 5, 10, 20];
    var _keys    = ["1", "2", "3", "4"];
    var _card_w  = 120;
    var _card_h  = 70;
    var _gap     = 10;
    var _total   = (_card_w * 4) + (_gap * 3);
    var _start_x = (_gui_w - _total) / 2;
    var _y       = _gui_h - _card_h - 10;
    
    draw_set_font(-1);
    
    for (var i = 0; i < 4; i++) {
        var _x = _start_x + i * (_card_w + _gap);
        var _is_unlocked = player_obj.weapons_unlocked[$ string(i + 1)];
        
        // Fond
        if (_is_unlocked) {
            draw_set_color(make_color_rgb(30, 80, 30));  // Vert = débloqué
        } else {
            draw_set_color(make_color_rgb(60, 20, 20));  // Rouge = bloqué
        }
        draw_rectangle(_x, _y, _x + _card_w, _y + _card_h, false);
        
        // Bordure
        draw_set_color(_is_unlocked ? c_green : c_red);
        draw_rectangle(_x, _y, _x + _card_w, _y + _card_h, true);
        
        // Nom
        draw_set_halign(fa_center);
        draw_set_color(c_white);
        draw_text(_x + _card_w/2, _y + 8, _names[i]);
        
        // Touche
        draw_set_color(c_yellow);
        draw_text(_x + _card_w/2, _y + 28, "[" + _keys[i] + "]");
        
        // Prix ou UNLOCKED
        if (_is_unlocked) {
            draw_set_color(c_lime);
            draw_text(_x + _card_w/2, _y + 48, "UNLOCKED");
        } else {
            draw_set_color(c_orange);
            draw_text(_x + _card_w/2, _y + 48, string(_costs[i]) + " gold");
        }
    }
    
    draw_set_halign(fa_left);
    draw_set_color(c_white);
}