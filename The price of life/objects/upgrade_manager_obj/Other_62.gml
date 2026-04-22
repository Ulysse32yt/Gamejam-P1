// Upgrade Manager - User Defined 0 Event
// Fonction pour appliquer les effets d'une amélioration spécifique

function apply_upgrade_effect(upgrade_id) {
    if (!global.upgrades_loaded) return;
    
    var upgrade = find_upgrade_by_id(upgrade_id);
    if (!upgrade) return;
    
    switch (upgrade_id) {
        case "lifetime":
            // Augmenter les points de vie du joueur
            global.health_bonus = upgrade.niveau_actuel * 2;
            break;
            
        case "damage":
            // Augmenter les dégâts des projectiles
            global.projectile_damage_bonus = upgrade.niveau_actuel * upgrade.effet_par_niveau;
            break;
            
        case "max_energy":
            // Augmenter l'énergie maximale du joueur
            global.max_energy_bonus = upgrade.niveau_actuel * upgrade.effet_par_niveau;
            if (instance_exists(player_obj)) {
                var player = instance_find(player_obj, 0);
                player.max_energy = 100 + global.max_energy_bonus;
            }
            break;
            
        case "energy_recovery":
            // Augmenter la vitesse de récupération d'énergie
            global.energy_recovery_bonus = upgrade.niveau_actuel * upgrade.effet_par_niveau;
            break;
    }
}

// Fonction pour appliquer tous les effets d'amélioration
function apply_upgrade_effects() {
    if (!global.upgrades_loaded) return;
    
    // Réinitialiser les bonus
    global.projectile_lifetime_bonus = 0;
    global.projectile_damage_bonus = 0;
    global.max_energy_bonus = 0;
    global.energy_recovery_bonus = 0;
    
    // Appliquer chaque amélioration
    for (var i = 0; i < array_length(global.upgrade_data.ameliorations); i++) {
        var upgrade = global.upgrade_data.ameliorations[i];
        apply_upgrade_effect(upgrade.id);
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

// Fonction pour ajouter des points d'amélioration
function add_upgrade_points(points) {
    if (!global.upgrades_loaded) return;
    
    global.upgrade_data.points_amelioration += points;
    save_upgrades();
}

// Appeler l'application des effets au démarrage
apply_upgrade_effects();
