x_speed = 0
y_speed = 0

move_speed = 5

weapon = axe_obj

upgrades_applied = false

// Crée et assigne une caméra
var _cam = camera_create_view(0, 0, 1366, 768, 0, id, -1, -1, -1, -1)
view_camera[0] = _cam
view_enabled = true
view_visible[0] = true
