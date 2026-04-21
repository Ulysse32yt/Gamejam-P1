x = player_obj.x
y = player_obj.y

if swinging {
	if hand == "left" {
		image_angle += 2
		if image_angle > angle_ending {
			image_angle = 0
			swinging = false
		}
	} else {
		image_angle -= 2
		if image_angle < angle_ending {
			image_angle = 0
			swinging = false
		}
	}
}