// Debug Test Object - Step Event
// Pour tester le système avec des touches

// Touche 1 : Ajouter 50 XP
if (keyboard_check_pressed(ord("1"))) {
    xp_obj.add_xp(50);
    show_debug_message("Added 50 XP for testing");
}

// Touche 2 : Ajouter 200 XP
if (keyboard_check_pressed(ord("2"))) {
    xp_obj.add_xp(200);
    show_debug_message("Added 200 XP for testing");
}

// Touche 3 : Afficher les stats actuelles
if (keyboard_check_pressed(ord("3"))) {
    show_debug_message("=== CURRENT STATS ===");
    show_debug_message("Player XP: " + string(global.player_xp));
    show_debug_message("Player Level: " + string(global.player_level));
    
    if (global.upgrades_loaded) {
        show_debug_message("Upgrades loaded successfully");
        for (var i = 0; i < array_length(global.upgrade_data.ameliorations); i++) {
            var upgrade = global.upgrade_data.ameliorations[i];
            show_debug_message(upgrade.nom + " - Level: " + string(upgrade.niveau_actuel) + "/" + string(upgrade.niveau_max));
        }
    } else {
        show_debug_message("Upgrades not loaded");
    }
    show_debug_message("===================");
}

// Touche 4 : Forcer la sauvegarde
if (keyboard_check_pressed(ord("4"))) {
    xp_obj.save_player_data();
    save_upgrades();
    show_debug_message("Forced save of all data");
}

// Touche 5: Ajouter 500 XP
if (keyboard_check_pressed(ord("5"))) {
    show_debug_message("Adding 500 XP for testing");
    global.player_xp += 500;
    xp_obj.save_player_data();
    show_debug_message("Total XP: " + string(global.player_xp));
}
