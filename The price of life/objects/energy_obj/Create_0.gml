// Énergie de base + bonus d'amélioration
max_energy = 100;
if (variable_global_exists("upgrades_loaded") && global.upgrades_loaded && variable_global_exists("max_energy_bonus")) {
    max_energy += global.max_energy_bonus;
}
energy = max_energy/2;

// Récupération de base + bonus d'amélioration
recup = 5;
if (variable_global_exists("upgrades_loaded") && global.upgrades_loaded && variable_global_exists("energy_recovery_bonus")) {
    recup += global.energy_recovery_bonus;
}

function lose_energy(number) {
	energy -= number
	if energy < 0 {
		energy = 0
	}
}

function update_energy_stats() {
    // Mettre à jour les stats quand les améliorations changent
    if (global.upgrades_loaded) {
        max_energy = 100 + (global.max_energy_bonus || 0);
        recup = 5 + (global.energy_recovery_bonus || 0);
    }
}