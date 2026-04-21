damage = 1
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
	
	cosinus = (mouse_x - player_obj.x) / (sqrt(sqr(mouse_x-player_obj.x)+sqr(mouse_y-player_obj.y)))
	angle = radtodeg(arccos(cosinus)) - 90
	
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

if (instance_exists(shop_manager_obj)) {
    damage += shop_manager_obj.lvl_damage * 1
}