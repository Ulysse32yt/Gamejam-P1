x_speed = 0
y_speed = 0

move_speed = 5

weapon = instance_create_layer(x, y, "weapons", machine_gun_obj)

upgrades_applied = false

// Crée et assigne une caméra
var _cam = camera_create_view(0, 0, 1366, 768, 0, id, -1, -1, -1, -1)
view_camera[0] = _cam
view_enabled = true
view_visible[0] = true
