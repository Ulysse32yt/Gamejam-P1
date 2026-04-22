damage = 3+global.lvl_damage
nb_hit = 3
nb_hit_left = nb_hit

energy_cost = 5
money_cost = 15

swinging = false
angle = 0
angle_origin = 0
angle_ending = 0



hand = "left"
image_angle = 45

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
	audio_play_sound(Axe, 1, false)
}

function switch_hands() {
	if not swinging {
		if hand == "left" {
			hand = "right"
			image_angle = -45
		} else {
			hand = "left"
			image_angle = 45
		}
	}
}