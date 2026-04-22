// XP Object - Step Event
// Gérer l'XP et convertir en points d'amélioration

if (xp_given) return;

// Sauvegarder l'XP quand il change
static last_xp = 0;
if (xp != last_xp) {
    save_player_data();
    last_xp = xp;
}

// Vérifier si le joueur a assez d'XP pour convertir en points d'amélioration
var xp_needed_for_point = 100; // 100 XP = 1 point d'amélioration

if (xp >= xp_needed_for_point) {
    var points_earned = floor(xp / xp_needed_for_point);
    xp -= points_earned * xp_needed_for_point;
    
    // Ajouter les points d'amélioration
    if (global.upgrades_loaded) {
        global.upgrade_data.points_amelioration += points_earned;
        save_upgrades();
        show_debug_message("Earned " + string(points_earned) + " upgrade points!");
    }
}
