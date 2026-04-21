player = instance_nearest(x, y, player_obj)

if (instance_exists(player)) {

    Direction = point_direction(x, y, player.x, player.y)
	if distance_to_object(player) > 210 {
		x += lengthdir_x(move_speed, Direction)
		y += lengthdir_y(move_speed, Direction)
	} else if distance_to_object(player) < 190 {
		x += lengthdir_x(move_speed/2, Direction-180)
		y += lengthdir_y(move_speed/2, Direction-180)
	}
	
	if Direction >90 and Direction < 270 {
		image_xscale = -1
	} else {
		image_xscale = 1	
	}
	
	if reloading > 0 {
		reloading += 1
		if reloading > reload_time {
			reloading = 0
		}
	}
	
	if reloading == 0 and distance_to_object(player) < 400 {
		reloading = 1
		var _bullet = instance_create_layer(x, y, "weapons", sentinel_bullet_obj)
		_bullet.damage = damage
		_bullet.direction = point_direction(x, y, player_obj.x, player_obj.y)
		_bullet.image_angle = _bullet.direction
	}
}


if cooldown > 0 {
	cooldown -= 1	
}