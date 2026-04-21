image_xscale = 0.5
image_yscale = 0.5
speed = 10
direction = point_direction(x, y, mouse_x, mouse_y)
alarm[0] = 60

damage = 1

if (instance_exists(shop_manager_obj)) {
    damage += shop_manager_obj.lvl_damage * 1
}