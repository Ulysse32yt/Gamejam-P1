// Upgrade Manager - Global Mouse Left Pressed Event
// Gérer les clics sur les boutons d'amélioration

if (!global.upgrades_loaded || !instance_exists(shop_ui_obj)) {
    return;
}

var shop_ui = instance_find(shop_ui_obj, 0);
if (!shop_ui) return;

// Position de départ pour les améliorations
var start_x = shop_ui.x + 50;
var start_y = shop_ui.y + 100;
var spacing_y = 80;

// Vérifier les clics sur les boutons d'amélioration
for (var i = 0; i < array_length(global.upgrade_data.ameliorations); i++) {
    var upgrade = global.upgrade_data.ameliorations[i];
    var y_pos = start_y + i * spacing_y;
    
    // Vérifier si le clic est sur le bouton d'amélioration
    if (mouse_x >= start_x + 200 && mouse_x <= start_x + 280 &&
        mouse_y >= y_pos + 40 && mouse_y <= y_pos + 55) {
        
        // Vérifier si l'amélioration peut être achetée
        if (upgrade.niveau_actuel < upgrade.niveau_max) {
            var cout = upgrade.cout * (upgrade.niveau_actuel + 1);
            
            // Vérifier si le joueur a assez de points d'amélioration
            if (global.upgrade_data.points_amelioration >= cout) {
                // Acheter l'amélioration
                global.upgrade_data.points_amelioration -= cout;
                upgrade.niveau_actuel++;
                
                // Appliquer l'effet immédiat
                apply_upgrade_effect(upgrade.id);
                
                // Sauvegarder
                save_upgrades();
                
                show_debug_message("Upgrade purchased: " + upgrade.nom);
            } else {
                show_debug_message("Not enough upgrade points");
            }
        }
    }
}
