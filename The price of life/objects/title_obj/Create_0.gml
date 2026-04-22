text = "THE PRICE\nOF LIFE"


if not variable_global_exists("initialized") {
	// Listes des upgrades
	global.lvl_hp = 0
	global.lvl_damage = 0
	global.lvl_max_energy = 0
	global.lvl_energy_recup = 0

	// Utils pour arme
	global.selected_weapon = "sword"
	global.unlocked_weapons = {sword: true, axe: false, rifle: false, machine_gun: false}
	
	global.initialized = true
}