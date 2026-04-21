damage = 1

swinging = false
angle = 0
angle_origin = 0
angle_ending = 0


hand = "left"

function start_swing() {
	if swinging {
		return
	}
	
	cosinus = (mouse_x - player_obj.x) / (sqrt((mouse_x-player_obj.x)^2+(mouse_y_player_obj.y)^2))
	angle = radtodeg(arccos(cosinus)) - 90
	
	if hand == "right" {
		angle_origin = angle + 45
		angle_ending = angle - 45
	} else {
		angle_origin = angle - 45
		angle_ending = angle + 45
	}
	
	image_angle = angle_origin
	swinging = true
}