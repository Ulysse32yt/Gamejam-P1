damage = 5
reload_time = 60 // 60 frame soit une seconde
reloading = 0


energy_cost = 4
money_cost = 20

angle = - 45
angle_origin = 0
angle_ending = 0


hand = "left"

function attack() {
	if reloading == 0 {
		direct = point_direction(x, y, mouse_x, mouse_y)
		x_cannon = 	x + lengthdir_x(60, direct)
		y_cannon =  y + lengthdir_y(60, direct)
		var _bullet = instance_create_layer(x_cannon, y_cannon, "Instances", rifle_bullet_obj)
		_bullet.speed = 20
		_bullet.damage = 5
		reloading = 1
		energy_obj.energy -= energy_cost
	}
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