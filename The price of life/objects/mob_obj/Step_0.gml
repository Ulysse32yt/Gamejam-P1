
player = instance_nearest(x, y, player_obj);

if (instance_exists(player)) {

    Direction = point_direction(x, y, player.x, player.y);
    
    x += lengthdir_x(moveSpeed, Direction);
    y += lengthdir_y(moveSpeed, Direction);
}