
player = instance_nearest(x, y, player_obj)

if (instance_exists(player)) {

    Direction = point_direction(x, y, player.x, player.y)
   
    x += lengthdir_x(move_speed, Direction)
    y += lengthdir_y(move_speed, Direction)
	
	if Direction >90 and Direction < 270 {
		image_xscale = -1
	} else {
		image_xscale = 1	
	}
}
