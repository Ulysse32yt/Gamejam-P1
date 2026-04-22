// Upgrade Manager - Draw Event
// Dessiner l'interface d'améliorations

if (!global.upgrades_loaded || !instance_exists(shop_ui_obj)) {
    return;
}

var shop_ui = instance_find(shop_ui_obj, 0);
if (!shop_ui) return;

// Position de départ pour les améliorations
var start_x = shop_ui.x + 50;
var start_y = shop_ui.y + 100;
var spacing_y = 80;

// Dessiner les améliorations
for (var i = 0; i < array_length(global.upgrade_data.ameliorations); i++) {
    var upgrade = global.upgrade_data.ameliorations[i];
    var y_pos = start_y + i * spacing_y;
    
    // Arrière-plan de l'amélioration
    draw_set_color(c_ltgray);
    draw_rectangle(start_x, y_pos, start_x + 300, y_pos + 60, false);
    
    // Bordure
    draw_set_color(c_black);
    draw_rectangle(start_x, y_pos, start_x + 300, y_pos + 60, true);
    
    // Nom de l'amélioration
    draw_set_color(c_black);
    draw_set_font(font_title);
    draw_text(start_x + 10, y_pos + 5, upgrade.nom);
    
    // Description
    draw_set_font(font_default);
    draw_text(start_x + 10, y_pos + 25, upgrade.description);
    
    // Niveau actuel / max
    draw_text(start_x + 10, y_pos + 45, "Niveau: " + string(upgrade.niveau_actuel) + "/" + string(upgrade.niveau_max));
    
    // Coût
    if (upgrade.niveau_actuel < upgrade.niveau_max) {
        var cout = upgrade.cout * (upgrade.niveau_actuel + 1);
        draw_text(start_x + 200, y_pos + 25, "Coût: " + string(cout));
        
        // Bouton d'amélioration
        draw_set_color(c_green);
        draw_rectangle(start_x + 200, y_pos + 40, start_x + 280, y_pos + 55, false);
        draw_set_color(c_black);
        draw_text(start_x + 220, y_pos + 42, "Améliorer");
    } else {
        draw_text(start_x + 200, y_pos + 40, "MAX");
    }
}
