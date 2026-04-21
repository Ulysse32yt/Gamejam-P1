x_speed = 0
y_speed = 0

move_speed = 5

weapon = sword_obj

// Crée et assigne une caméra
var _cam = camera_create_view(0, 0, 1366, 768, 0, id, -1, -1, -1, -1)
view_camera[0] = _cam
view_enabled = true
view_visible[0] = true

// Applique les upgrades du shop
if (instance_exists(shop_manager_obj)) {
    energy_obj.max_energy += shop_manager_obj.lvl_max_energy * 20
    energy_obj.energy = energy_obj.max_energy / 2
    energy_obj.recup += shop_manager_obj.lvl_energy_recup * 1
}