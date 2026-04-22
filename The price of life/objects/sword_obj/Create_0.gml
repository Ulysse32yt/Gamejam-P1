damage = 1 + lvl_damage
nb_hit = 1 // nombre de coup que l'on peut distribuer en un swing
nb_hit_left = nb_hit

energy_cost = 3
money_cost = 10

swinging = false
angle = 0
angle_origin = 0
angle_ending = 0


hand = "left"

function attack() {
	if swinging {
		return
	}
	
	angle = point_direction(x, y, mouse_x, mouse_y) - 90
	
	if hand == "right" {
		angle_origin = angle + 45
		angle_ending = angle - 45
	} else {
		angle_origin = angle - 45
		angle_ending = angle + 45
	}
	
	image_angle = angle_origin
	swinging = true
	energy_obj.energy -= energy_cost
}

function switch_hands() {
	if hand == "left" {
		hand = "right"
	} else {
		hand = "left"
	}
}