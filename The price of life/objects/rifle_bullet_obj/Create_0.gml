speed = 10
direction = point_direction(x, y, mouse_x, mouse_y)
image_angle = direction
alarm[0] = 120

damage = 1

if (instance_exists(shop_manager_obj)) {
    damage += shop_manager_obj.lvl_damage * 1
}