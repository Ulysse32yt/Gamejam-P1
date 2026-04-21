move_speed = 2
Direction = 0
player = 0

damage = 1
attack_cooldown = 60
cooldown = 0
reload_time = 180
reloading = 0

hp_max = 1
hp = 1

_bar_width = 64
_bar_height = 6
_bar_x = 0
_bar_y = 0

function lose_hp(value) {
	hp -= value
	if hp <= 0 {
		instance_create_layer(x, y, "Instances", gold_obj)
		instance_destroy()
	}
}