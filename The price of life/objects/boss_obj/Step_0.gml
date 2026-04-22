player = instance_nearest(x, y, player_obj)

if (instance_exists(player)) {

	Direction = point_direction(x, y, player.x, player.y)
   
    if Direction >90 and Direction < 270 {
		image_xscale = -1
	} else {
		image_xscale = 1	
	}
	
	if phase == "classic" {
		x += lengthdir_x(move_speed, Direction)
		y += lengthdir_y(move_speed, Direction)
		cooldown -= 1
		
		if cooldown <= 0 {
			rand = random(1)
			if rand < 0.3 {
				phase = "dash"
				cooldown = phase_cooldowns[$ "dash"]
			} else if rand < 0.6 {
				phase = "throwing"
				cooldown = phase_cooldowns[$ "throwing"]
			} else {
				phase = "shooting"
				cooldown = phase_cooldowns[$ "shooting"]
			}
		}
		
	} else {
		if phase == "dash" {
			x += lengthdir_x(10, Direction)
			y += lengthdir_y(10, Direction)
		} else if phase == "shooting" {
			if cooldown == 55 or cooldown == 35 or cooldown == 15 {
				var _bullet = instance_create_layer(x, y, "weapons", sentinel_bullet_obj)
				_bullet.damage = damage
				_bullet.direction = point_direction(x, y, player_obj.x, player_obj.y)
				_bullet.image_angle = _bullet.direction
			}
		} else if phase == "throwing" {
			if cooldown == 115 or cooldown == 25 {
				var _projectile = instance_create_layer(x, y, "weapons", projectile_obj)
				_projectile.direction = point_direction(x, y, player_obj.x, player_obj.y)
				_projectile.image_angle = _projectile.direction
			}
		}
		
		cooldown -= 1
		if cooldown <= 0 {
			phase = "classic"
			cooldown = phase_cooldowns[$ "classic"]
		}
	}
}