x_speed = keyboard_check(vk_right) - keyboard_check(vk_left)
y_speed = keyboard_check(vk_down) - keyboard_check(vk_up)

if place_meeting(x+x_speed*move_speed, y, mur_obj) {
	x_speed = 0
}

if place_meeting(x, y+y_speed*move_speed, mur_obj) {
	y_speed = 0
}

if mouse_check_button_pressed(mb_left) {
	instance_create_layer(x, y, "Instances", projectile_obj)
}

x = x+x_speed*move_speed
y = y+y_speed*move_speed

if place_meeting(x, y, mob_obj) {
	instance_destroy()
}