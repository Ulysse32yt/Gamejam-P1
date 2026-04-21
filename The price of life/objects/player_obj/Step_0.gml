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

if mouse_check_button_pressed(mb_left) {
	instance_create_layer(x, y, "Instances", projectile_obj)
}

x = x+x_speed*move_speed
y = y+y_speed*move_speed

if place_meeting(x, y, mob_obj) {
	with (game_manager_obj) {
        game_over = true
    }
	instance_destroy()
}

// Clamp la caméra dans les limites de la room
var _cam = view_camera[0]
var _cx = clamp(x - 683, 0, room_width - 1366)
var _cy = clamp(y - 384, 0, room_height - 768)
camera_set_view_pos(_cam, _cx, _cy)