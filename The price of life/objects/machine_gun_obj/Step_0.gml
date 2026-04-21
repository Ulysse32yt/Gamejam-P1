if hand == "left" {
	x = player_obj.x - 18
	y = player_obj.y + 4
} else {
	x = player_obj.x + 18
	y = player_obj.y + 6
}


image_angle = point_direction(x, y, mouse_x, mouse_y)

if image_angle > 90 and image_angle < 270 {
	image_yscale = -1	
} else {
	image_yscale = 1
}

if reloading > 0 {
	reloading += 1
	if reloading > reload_time {
		reloading = 0
	}
}
