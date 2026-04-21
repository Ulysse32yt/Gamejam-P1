// Initialiser le système d'améliorations
if (!variable_global_exists("upgrades_loaded")) {
    global.upgrades_loaded = false;
    global.upgrade_data = {};
}

// Toujours essayer de charger les améliorations au démarrage
if (!global.upgrades_loaded) {
    load_upgrades();
}

// Forcer le chargement des données XP si pas encore fait
if (!variable_global_exists("player_level")) {
    if (instance_exists(xp_obj)) {
        xp_obj.load_player_data();
    }
}

// Ne pas vérifier le chargement à chaque frame pour éviter la boucle infinie
// La vérification se fait dans le shop_ui_obj

// Charger les améliorations depuis le JSON
function load_upgrades() {
    var file_path = "datafiles/ameliorations.json";
    if (file_exists(file_path)) {
        var file = file_text_open_read(file_path);
        if (file != -1) {
            var json_string = file_text_read_string(file);
            file_text_close(file);
            if (json_string != "") {
                global.upgrade_data = json_parse(json_string);
                global.upgrades_loaded = true;
                show_debug_message("Upgrades loaded successfully");
                
                // Appliquer immédiatement tous les effets d'amélioration
                apply_all_upgrade_effects();
            }
        } else {
            show_debug_message("Failed to open upgrades file for reading");
        }
    }
}

// Sauvegarder les améliorations
function save_upgrades() {
    if (!global.upgrades_loaded) return;
    
    show_debug_message("Saving upgrades to file...");
    // Utiliser le répertoire du projet pour une sauvegarde permanente
    var file_path = "datafiles\\ameliorations.json";
    show_debug_message("Project file path: " + file_path);
    
    // Afficher les niveaux actuels avant sauvegarde
    for (var i = 0; i < array_length(global.upgrade_data.ameliorations); i++) {
        var upgrade = global.upgrade_data.ameliorations[i];
        show_debug_message("Before save - " + upgrade.nom + " Level: " + string(upgrade.niveau_actuel));
    }
    
    var json_string = json_stringify(global.upgrade_data);
    show_debug_message("JSON to save: " + json_string);
    
    // Sauvegarder dans le répertoire du projet
    var file = file_text_open_write(file_path);
    if (file != -1) {
        file_text_write_string(file, json_string);
        file_text_close(file);
        show_debug_message("Upgrades saved successfully to project directory!");
        
        // Vérification immédiate
        var verify_file = file_text_open_read(file_path);
        if (verify_file != -1) {
            var verify_content = file_text_read_string(verify_file);
            file_text_close(verify_file);
            show_debug_message("Verification - File content after save: " + verify_content);
            
            try {
                var verify_data = json_parse(verify_content);
                show_debug_message("Verification - Parsed data matches: " + string(verify_data == global.upgrade_data));
                
                // Afficher les niveaux après vérification
                for (var i = 0; i < array_length(verify_data.ameliorations); i++) {
                    var upgrade = verify_data.ameliorations[i];
                    show_debug_message("After save - " + upgrade.nom + " Level: " + string(upgrade.niveau_actuel));
                }
            } catch(e) {
                show_debug_message("Verification - Parse error: " + string(e));
            }
        } else {
            show_debug_message("Verification - Failed to read saved file");
        }
    } else {
        show_debug_message("Failed to save upgrades file!");
    }
}

// Fonction pour trouver une amélioration par son ID
function find_upgrade_by_id(upgrade_id) {
    if (!global.upgrades_loaded) return noone;
    
    for (var i = 0; i < array_length(global.upgrade_data.ameliorations); i++) {
        var upgrade = global.upgrade_data.ameliorations[i];
        if (upgrade.id == upgrade_id) {
            return upgrade;
        }
    }
    return noone;
}

// Fonction pour obtenir le coût d'une amélioration
function get_upgrade_cost(upgrade_id) {
    if (!global.upgrades_loaded) return 0;
    
    var upgrade = find_upgrade_by_id(upgrade_id);
    if (!upgrade) return 0;
    
    if (upgrade.niveau_actuel >= upgrade.niveau_max) return 0;
    
    return upgrade.cout * (upgrade.niveau_actuel + 1);
}

// Fonction pour acheter une amélioration
function buy_upgrade(upgrade_id) {
    var upgrade = find_upgrade_by_id(upgrade_id);
    if (!upgrade) return false;
    
    var cost = get_upgrade_cost(upgrade_id);
    var xp = 0;
    
    // Vérifier si player_xp existe, sinon utiliser l'XP depuis les données
    if (variable_global_exists("player_xp")) {
        xp = global.player_xp;
    } else if (instance_exists(xp_obj)) {
        xp = xp_obj.xp;
    }
    
    if (xp >= cost) {
        // Déduire l'XP
        if (variable_global_exists("player_xp")) {
            global.player_xp -= cost;
        } else if (instance_exists(xp_obj)) {
            xp_obj.xp -= cost;
        }
        
        upgrade.niveau_actuel++;
        show_debug_message("Upgrade level increased to: " + string(upgrade.niveau_actuel));
        
        // Appliquer l'effet de l'amélioration
        apply_upgrade_effect(upgrade_id);
        
        // Sauvegarder les données
        show_debug_message("Saving upgrade data...");
        save_upgrades();
        show_debug_message("Upgrade data saved. New level: " + string(upgrade.niveau_actuel));
        
        if (instance_exists(xp_obj)) {
            xp_obj.save_player_data();
        }
        
        return true;
    }
    
    return false;
}

// Fonction pour appliquer les effets d'une amélioration
function apply_upgrade_effect(upgrade_id) {
    if (!global.upgrades_loaded) return;
    
    var upgrade = find_upgrade_by_id(upgrade_id);
    if (!upgrade) return;
    
    switch (upgrade_id) {
        case "lifetime":
            global.projectile_lifetime_bonus = upgrade.niveau_actuel * upgrade.effet_par_niveau;
            break;
        case "damage":
            global.projectile_damage_bonus = upgrade.niveau_actuel * upgrade.effet_par_niveau;
            break;
        case "max_energy":
            global.max_energy_bonus = upgrade.niveau_actuel * upgrade.effet_par_niveau;
            if (instance_exists(energy_obj)) {
                var energy = instance_find(energy_obj, 0);
                energy.max_energy = 100 + global.max_energy_bonus;
                // Forcer la mise à jour de l'énergie actuelle si nécessaire
                if (energy.energy > energy.max_energy) {
                    energy.energy = energy.max_energy;
                }
            }
            break;
        case "energy_recovery":
            global.energy_recovery_bonus = upgrade.niveau_actuel * upgrade.effet_par_niveau;
            if (instance_exists(energy_obj)) {
                var energy = instance_find(energy_obj, 0);
                energy.recup = 5 + global.energy_recovery_bonus;
            }
            break;
    }
    
    show_debug_message("Applied upgrade effect: " + upgrade_id + " (Level " + string(upgrade.niveau_actuel) + ")");
}

// Fonction pour appliquer tous les effets d'amélioration (au chargement)
function apply_all_upgrade_effects() {
    if (!global.upgrades_loaded) return;
    
    // Réinitialiser les bonus
    global.projectile_lifetime_bonus = 0;
    global.projectile_damage_bonus = 0;
    global.max_energy_bonus = 0;
    global.energy_recovery_bonus = 0;
    
    // Appliquer chaque amélioration
    for (var i = 0; i < array_length(global.upgrade_data.ameliorations); i++) {
        var upgrade = global.upgrade_data.ameliorations[i];
        if (upgrade.niveau_actuel > 0) {
            apply_upgrade_effect(upgrade.id);
        }
    }
}

// Initialiser les bonus
global.projectile_lifetime_bonus = 0;
global.projectile_damage_bonus = 0;
global.max_energy_bonus = 0;
global.energy_recovery_bonus = 0;