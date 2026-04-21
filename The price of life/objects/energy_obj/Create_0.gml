max_energy = 100
energy = max_energy/2

function lose_energy(number) {
	energy -= number
	if energy < 0 {
		energy = 0
	}
}