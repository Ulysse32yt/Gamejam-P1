var _gui_w = display_get_gui_width()
var _gui_h = display_get_gui_height()
var _shop = shop_manager_obj
var _xp = xp_obj

draw_set_font(-1)

// Titre
draw_set_halign(fa_center)
draw_set_color(c_yellow)
draw_text_transformed(_gui_w/2, 40, "SHOP", 2, 2, 0)

// Données des upgrades
var _names  = ["Lifetime",        "Damage",       "Max energy",          "Energy Recovery"]
var _descs  = ["+10 max energy",     "+1 damage",             "+20 max energy",      "+1 recov/sec"]
var _lvls   = [_shop.lvl_lifetime,    _shop.lvl_damage,       _shop.lvl_max_energy,   _shop.lvl_energy_recup]

// Dessin des 4 cartes
var _card_w = 250
var _card_h = 160
var _gap    = 30
var _total  = (_card_w * 4) + (_gap * 3)
var _start_x = (_gui_w - _total) / 2
var _y = _gui_h / 2 - _card_h / 2

for (var i = 0; i < 4; i++) {
    var _x = _start_x + i * (_card_w + _gap)
    var _cost = _shop.get_cost(_lvls[i])
    var _can_afford = (_xp.xp >= _cost)
    
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
    draw_text(_x + _card_w/2, _y + 115, "Cost : " + string(_cost) + " XP")
}

draw_set_halign(fa_left)
draw_set_color(c_white)