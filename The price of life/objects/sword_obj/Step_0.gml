if hand == "left" {
	x = player_obj.x - 18
	y = player_obj.y + 4
} else {
	x = player_obj.x + 18
	y = player_obj.y + 6
}

if swinging {
	if hand == "left" {
		image_angle += 4
		if image_angle > angle_ending {
			image_angle = 0
			swinging = false
		}
	} else {
		image_angle -= 4
		if image_angle < angle_ending {
			image_angle = 0
			swinging = false
			nb_hit_left = nb_hit
		}
	}
}