damage = 8 + global.lvl_damage
bullet_speed = 20
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
		var _bullet = instance_create_layer(x_cannon, y_cannon, "Instances", bullet_obj)
		_bullet.speed = bullet_speed
		_bullet.damage = damage
		reloading = 1
		energy_obj.energy -= energy_cost
		audio_play_sound(Gun_Sounds, 1,false)
	}
}

function switch_hands() {
	if hand == "left" {
		hand = "right"
	} else {
		hand = "left"
	}
}