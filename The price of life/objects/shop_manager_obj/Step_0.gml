// Niveaux des upgrades
lvl_lifetime = 0
lvl_damage = 0
lvl_max_energy = 0
lvl_energy_recup = 0

// Coût en XP (augmente à chaque niveau)
function get_cost(lvl) {
    return 3 + (lvl * 2)
}