hp_max = 2 + global.lvl_hp
hp = hp_max

x_speed = 0
y_speed = 0

_bar_width = 64
_bar_height = 6
_bar_x = 0
_bar_y = 0

cooldown_damage_total = 60
cooldown_damage = 0

move_speed = 5

weapon = instance_create_layer(x, y, "weapons", machine_gun_obj)


// Crée et assigne une caméra
var _cam = camera_create_view(0, 0, 1366, 768, 0, id, -1, -1, -1, -1)
view_camera[0] = _cam
view_enabled = true
view_visible[0] = true


function lose_hp(number) {
	if cooldown_damage == 0 {
		hp -= number
		audio_play_sound(Damage, 1, false)
		if hp <= 0 {
			instance_destroy(weapon)
			instance_destroy()
			audio_play_sound(Death, 1, false)
			with (game_manager_obj) {
				game_over = true
			}
		}
		cooldown_damage = cooldown_damage_total
	}
}