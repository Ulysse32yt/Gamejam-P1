move_speed = 1
Direction = 0
player = 0

damage = 4
reload_time = 180
reloading = 0

hp_max = 500
hp = hp_max

_bar_width = 64
_bar_height = 6
_bar_x = 0
_bar_y = 0


phase_cooldowns = {"classic": 300, "dash": 60, "shooting": 60, "throwing": 120}
cooldown = phase_cooldowns[$ "classic"]
phase = "classic"


function lose_hp(value) {
	hp -= value
	if hp <= 0 {
		instance_destroy()
	}
}