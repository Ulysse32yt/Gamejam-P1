max_energy = 100 + global.lvl_max_energy*20
energy = max_energy
recup = 5 + global.lvl_energy_recup*5
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