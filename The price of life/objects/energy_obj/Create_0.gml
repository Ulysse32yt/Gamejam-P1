max_energy = 100 + (global.max_energy_bonus != undefined ? global.max_energy_bonus : 0)
energy = max_energy
recup = 5 + (global.energy_recovery_bonus != undefined ? global.energy_recovery_bonus : 0)
not_enough_energy_cooldown = 120
cooldown = 0

function lose_energy(number) {
	energy -= number
	if energy < 0 {
		energy = 0
	}
}

function print_not_enough_energy() {
	if cooldown > 0 {
		return
	} else {	
		cooldown  = not_enough_energy_cooldown
	}
}