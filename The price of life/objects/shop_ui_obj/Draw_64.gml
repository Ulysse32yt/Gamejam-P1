var _gui_w = display_get_gui_width()
var _gui_h = display_get_gui_height()
var _shop = shop_manager_obj
var _xp = xp_obj

draw_set_font(title_font)

// Titre
draw_set_halign(fa_center)
draw_set_color(c_yellow)
draw_text(_gui_w/2, 40, "SHOP")

draw_set_font(-1)

// Données des upgrades
var _names  = ["Lifetime",        "Damage",       "Max energy",          "Energy Recovery"]
var _descs  = ["+30 lifetime",     "+5 damage",             "+20 max energy",      "+0.5 recov/sec"]

// Récupérer les niveaux depuis le système JSON
var _lvls = [];
if (global.upgrades_loaded && global.upgrade_data.ameliorations != undefined) {
    // Chercher directement dans le tableau d'améliorations
    for (var i = 0; i < array_length(global.upgrade_data.ameliorations); i++) {
        var upgrade = global.upgrade_data.ameliorations[i];
        switch (upgrade.id) {
            case "lifetime":
                _lvls[0] = upgrade.niveau_actuel;
                break;
            case "damage":
                _lvls[1] = upgrade.niveau_actuel;
                break;
            case "max_energy":
                _lvls[2] = upgrade.niveau_actuel;
                break;
            case "energy_recovery":
                _lvls[3] = upgrade.niveau_actuel;
                break;
        }
    }
} else {
    _lvls = [0, 0, 0, 0];
}

// Dessin des 4 cartes
var _card_w = 250
var _card_h = 160
var _gap    = 30
var _total  = (_card_w * 4) + (_gap * 3)
var _start_x = (_gui_w - _total) / 2
var _y = _gui_h / 2 - _card_h / 2

for (var i = 0; i < 4; i++) {
    var _x = _start_x + i * (_card_w + _gap)
    
    // Calculer le coût avec le nouveau système
    var _upgrade_ids = ["lifetime", "damage", "max_energy", "energy_recovery"];
    var _cost = _shop.get_upgrade_cost(_upgrade_ids[i]);
    var _can_afford = (global.upgrades_loaded && global.upgrade_data.points_amelioration >= _cost)
    
    // Fond de la carte
    if (selected == i) {
        draw_set_color(c_dkgray)
    } else {
        draw_set_color(make_color_rgb(40, 40, 40))
    }
    draw_rectangle(_x, _y, _x + _card_w, _y + _card_h, false)
    
    // Bordure
    draw_set_color(_can_afford ? c_yellow : c_gray)
    draw_rectangle(_x, _y, _x + _card_w, _y + _card_h, true)
    
    // Nom
    draw_set_halign(fa_center)
    draw_set_color(c_white)
    draw_text_transformed(_x + _card_w/2, _y + 15, _names[i], 1.1, 1.1, 0)
    
    // Description
    draw_set_color(c_ltgray)
    draw_text(_x + _card_w/2, _y + 55, _descs[i])
    
    // Niveau
    draw_set_color(c_aqua)
    draw_text(_x + _card_w/2, _y + 85, "Level : " + string(_lvls[i]))
    
    // Coût
    draw_set_color(_can_afford ? c_yellow : c_red)
    draw_text(_x + _card_w/2, _y + 115, "Cost : " + string(_cost) + " pts")
}

var _btn_w = 160
var _btn_h = 50
var _btn_x = 30
var _btn_y = _gui_h - 80

var _gui_mx = device_mouse_x_to_gui(0)
var _gui_my = device_mouse_y_to_gui(0)
var _hover = point_in_rectangle(_gui_mx, _gui_my, _btn_x, _btn_y, _btn_x + _btn_w, _btn_y + _btn_h)

draw_set_color(_hover ? c_yellow : make_color_rgb(40, 40, 40))
draw_rectangle(_btn_x, _btn_y, _btn_x + _btn_w, _btn_y + _btn_h, false)
draw_set_color(_hover ? c_black : c_white)
draw_set_halign(fa_center)
draw_text_transformed(_btn_x + _btn_w/2, _btn_y + 12, "< Retour", 1.1, 1.1, 0)

draw_set_halign(fa_left)
draw_set_color(c_white)