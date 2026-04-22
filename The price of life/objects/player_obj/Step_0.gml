x_speed = keyboard_check(vk_right) - keyboard_check(vk_left)
y_speed = keyboard_check(vk_down) - keyboard_check(vk_up)

x_speed = keyboard_check(ord("D")) - (keyboard_check(ord("Q")) or keyboard_check(ord("A")))
y_speed = keyboard_check(ord("S")) - (keyboard_check(ord("Z")) or keyboard_check(ord("W")))

if place_meeting(x+x_speed*move_speed, y, mur_obj) or (x + x_speed*move_speed < 0) or (x + x_speed*move_speed > room_width) {
	x_speed = 0
}

if place_meeting(x, y+y_speed*move_speed, mur_obj) or (y + y_speed*move_speed < 0) or (y + y_speed*move_speed > room_height) {
	y_speed = 0
}

if keyboard_check(ord("1")) {
	switch_weapon(1)
} else if keyboard_check(ord("2")) {
	switch_weapon(2)	
} else if keyboard_check(ord("3")) {
	switch_weapon(3)	
} else if keyboard_check(ord("4")) {
	switch_weapon(4)	
}

var _gui_x = device_mouse_x_to_gui(0);
var _gui_y = device_mouse_y_to_gui(0);

if mouse_check_button(mb_left) {										// Si click
	if not (point_in_rectangle(_gui_x, _gui_y, 0, 128, 128, 256)) {		// Et pas sur energy
		if energy_obj.energy > weapon.energy_cost {						// Et assez d'énergie :
			weapon.attack()												// Déclencher l'attaque
		} else {
			energy_obj.print_not_enough_energy()
		}
	}
}


if x_speed != 0 {
	if energy_obj.energy > 0.1 {
		energy_obj.lose_energy(0.1)
		x = x+x_speed*move_speed
		
		if (x_speed > 0 and weapon.hand == "left") or (x_speed < 0 and weapon.hand = "right") {
			weapon.switch_hands()
		}
	} else {
		energy_obj.print_not_enough_energy()	
	}
}

if y_speed != 0 {
	if energy_obj.energy > 0.1 {
		energy_obj.lose_energy(0.1)
		y = y+y_speed*move_speed
	} else {
		energy_obj.print_not_enough_energy()	
	}
}


// Clamp la caméra dans les limites de la room
var _cam = view_camera[0]
var _cx = clamp(x - 683, 0, room_width - 1366)
var _cy = clamp(y - 384, 0, room_height - 768)
camera_set_view_pos(_cam, _cx, _cy)

if cooldown_damage > 0 {
	cooldown_damage -= 1	
}