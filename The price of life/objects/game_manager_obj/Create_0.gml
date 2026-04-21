wave = 1
mobs_per_wave = 3       // Mobs au départ
mobs_remaining = 0      // Mobs encore en vie
mobs_to_spawn = 0       // Mobs à faire spawner
spawn_timer = 0
spawn_delay = 60        // 1 seconde entre chaque spawn
wave_started = false
wave_clear_timer = 0    // Pause entre les vagues
gold = 0
game_over = false
xp_given = false

start_next_wave()

function start_next_wave() {
    mobs_to_spawn = mobs_per_wave
    spawn_timer = spawn_delay
    wave_started = true
    wave_clear_timer = 0
}

function spawn_mob() {
    // Récupère la position actuelle de la caméra
    var _cam = view_camera[0]
    var _cx = camera_get_view_x(_cam)
    var _cy = camera_get_view_y(_cam)
    var _cw = camera_get_view_width(_cam)
    var _ch = camera_get_view_height(_cam)
    
    // Spawn juste en dehors des bords de la caméra
    var _margin = 80 // Distance hors écran
    var _side = irandom(3)
    var _sx, _sy
    
    switch (_side) {
        case 0: // Haut
            _sx = _cx + irandom(_cw)
            _sy = _cy - _margin
            break
        case 1: // Bas
            _sx = _cx + irandom(_cw)
            _sy = _cy + _ch + _margin
            break
        case 2: // Gauche
            _sx = _cx - _margin
            _sy = _cy + irandom(_ch)
            break
        case 3: // Droite
            _sx = _cx + _cw + _margin
            _sy = _cy + irandom(_ch)
            break
    }
    
    // Garde dans les limites de la room
    _sx = clamp(_sx, 0, room_width)
    _sy = clamp(_sy, 0, room_height)
    
    var _mob = instance_create_layer(_sx, _sy, "Instances", mob_obj)
    _mob.hp        = 2 + (wave*(wave+1))/2
    _mob.hp_max    = 2 + (wave*(wave+1))/2
    _mob.move_speed = 1.5 + (wave * 0.15)
}