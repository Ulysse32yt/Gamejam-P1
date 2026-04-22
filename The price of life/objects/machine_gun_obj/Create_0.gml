damage = 1 + global.lvl_damage
bullet_speed = 15
reload_time = 6 // 12 frames soit 5 balles /s
reloading = 0


energy_cost = 1
money_cost = 20

angle_origin = 0
angle_ending = 0


hand = "left"

function attack() {
	if reloading == 0 {
		direct = point_direction(x, y, mouse_x, mouse_y)
		x_cannon = 	x + lengthdir_x(50, direct)
		y_cannon =  y + lengthdir_y(50, direct)
		var _bullet = instance_create_layer(x_cannon, y_cannon, "weapons", bullet_obj)
		_bullet.speed = bullet_speed
		_bullet.damage = damage
		reloading = 1
		energy_obj.energy -= energy_cost
		audio_play_sound(Gun_Sounds, 1, false)
	}
}

function switch_hands() {
	if hand == "left" {
		hand = "right"
	} else {
		hand = "left"
	}
}

// Appliquer les bonus d'amélioration de dégâts
if (variable_global_exists("upgrades_loaded") && global.upgrades_loaded && variable_global_exists("projectile_damage_bonus")) {
    damage += global.projectile_damage_bonus;
}