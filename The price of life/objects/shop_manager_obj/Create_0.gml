// Shop Manager Object - Create Event
// Initialiser le shop_manager_obj

show_debug_message("Shop Manager Object Created");

// Forcer le rechargement des améliorations à chaque création
show_debug_message("Forcing upgrade reload from file...");

// Données par défaut si le chargement échoue
var default_data = {
    "ameliorations": [
        {"id": "lifetime", "nom": "Lifetime", "description": "Augmente la durée de vie des projectiles", "cout": 3, "niveau_max": 5, "niveau_actuel": 0, "effet_par_niveau": 30},
        {"id": "damage", "nom": "Damage", "description": "Augmente les dégâts des projectiles", "cout": 3, "niveau_max": 5, "niveau_actuel": 0, "effet_par_niveau": 5},
        {"id": "max_energy", "nom": "Max Energy", "description": "Augmente l'énergie maximale", "cout": 3, "niveau_max": 5, "niveau_actuel": 0, "effet_par_niveau": 20},
        {"id": "energy_recovery", "nom": "Energy Recovery", "description": "Augmente la récupération d'énergie", "cout": 3, "niveau_max": 5, "niveau_actuel": 0, "effet_par_niveau": 2}
    ],
    "points_amelioration": 0
};

// Toujours essayer de charger depuis le fichier dans appdata
var file_path = "ameliorations.json";
show_debug_message("Attempting to load upgrades from appdata: " + file_path);

var file = file_text_open_read(file_path);
if (file != -1) {
    var json_string = file_text_read_string(file);
    file_text_close(file);
    if (json_string != "" && json_string != undefined) {
        try {
            global.upgrade_data = json_parse(json_string);
            global.upgrades_loaded = true;
            show_debug_message("Upgrades loaded successfully!");
            show_debug_message("Upgrade data: " + string(global.upgrade_data));
            
            // Appliquer immédiatement tous les effets d'amélioration
            // Initialiser les bonus globaux
            global.projectile_lifetime_bonus = 0;
            global.projectile_damage_bonus = 0;
            global.max_energy_bonus = 0;
            global.energy_recovery_bonus = 0;
            
            // Appliquer les effets de chaque amélioration
            var ameliorations_list = global.upgrade_data.ameliorations;
            if (is_array(ameliorations_list)) {
                for (var i = 0; i < array_length(ameliorations_list); i++) {
                    var upgrade = ameliorations_list[i];
                    var level = upgrade.niveau_actuel || 0;
                    var effect_per_level = upgrade.effet_par_niveau || 0;
                    var total_effect = level * effect_per_level;
                    var upgrade_id = upgrade.id;
                    
                    switch(upgrade_id) {
                        case "lifetime":
                            global.projectile_lifetime_bonus = total_effect;
                            break;
                        case "damage":
                            global.projectile_damage_bonus = total_effect;
                            break;
                        case "max_energy":
                            global.max_energy_bonus = total_effect;
                            // Mettre à jour l'énergie maximale si l'objet energy_obj existe
                            if (instance_exists(energy_obj)) {
                                energy_obj.max_energy = 100 + global.max_energy_bonus;
                                energy_obj.energy = min(energy_obj.energy, energy_obj.max_energy);
                            }
                            break;
                        case "energy_recovery":
                            global.energy_recovery_bonus = total_effect;
                            // Mettre à jour la récupération d'énergie si l'objet energy_obj existe
                            if (instance_exists(energy_obj)) {
                                energy_obj.recovery_rate = 1 + global.energy_recovery_bonus;
                            }
                            break;
                    }
                }
            }
            show_debug_message("Upgrade effects applied!");
        } catch(e) {
            global.upgrade_data = default_data;
            global.upgrades_loaded = true;
            show_debug_message("JSON parse error, using default data: " + string(e));
        }
    } else {
        global.upgrade_data = default_data;
        global.upgrades_loaded = true;
        show_debug_message("Using default upgrade data (JSON empty)");
    }
} else {
    global.upgrade_data = default_data;
    global.upgrades_loaded = true;
    show_debug_message("Using default upgrade data (file not found)");
}

show_debug_message("Upgrades system initialized!");
show_debug_message("Data: " + string(global.upgrade_data));

// Appliquer immédiatement tous les effets d'amélioration
// Initialiser les bonus globaux
global.projectile_lifetime_bonus = 0;
global.projectile_damage_bonus = 0;
global.max_energy_bonus = 0;
global.energy_recovery_bonus = 0;

// Appliquer les effets de chaque amélioration
var ameliorations_list = global.upgrade_data.ameliorations;
if (is_array(ameliorations_list)) {
    for (var i = 0; i < array_length(ameliorations_list); i++) {
        var upgrade = ameliorations_list[i];
        var level = upgrade.niveau_actuel || 0;
        var effect_per_level = upgrade.effet_par_niveau || 0;
        var total_effect = level * effect_per_level;
        var upgrade_id = upgrade.id;
        
        switch(upgrade_id) {
            case "lifetime":
                global.projectile_lifetime_bonus = total_effect;
                break;
            case "damage":
                global.projectile_damage_bonus = total_effect;
                break;
            case "max_energy":
                global.max_energy_bonus = total_effect;
                // Mettre à jour l'énergie maximale si l'objet energy_obj existe
                if (instance_exists(energy_obj)) {
                    energy_obj.max_energy = 100 + global.max_energy_bonus;
                    energy_obj.energy = min(energy_obj.energy, energy_obj.max_energy);
                }
                break;
            case "energy_recovery":
                global.energy_recovery_bonus = total_effect;
                // Mettre à jour la récupération d'énergie si l'objet energy_obj existe
                if (instance_exists(energy_obj)) {
                    energy_obj.recovery_rate = 1 + global.energy_recovery_bonus;
                }
                break;
        }
    }
}
show_debug_message("Upgrade effects applied!");
