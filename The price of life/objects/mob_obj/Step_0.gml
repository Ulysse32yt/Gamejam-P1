
var _player = instance_nearest(x, y, player_obj);

if (instance_exists(_player)) {
    
    
    var _speed = 2;
    
    
    var _dir = point_direction(x, y, _player.x, _player.y);
    
    
    x += lengthdir_x(_speed, _dir);
    y += lengthdir_y(_speed, _dir);
    
}