wave = 1
mobs_per_wave = 3       // Mobs au départ
mobs_remaining = 0      // Mobs encore en vie
mobs_to_spawn = 0       // Mobs à faire spawner
spawn_timer = 0
spawn_delay = 60        // 1 seconde entre chaque spawn
wave_started = false
wave_clear_timer = 0    // Pause entre les vagues

start_next_wave()

function start_next_wave() {
    mobs_to_spawn = mobs_per_wave
    spawn_timer = spawn_delay
    wave_started = true
    wave_clear_timer = 0
}

function spawn_mob() {
    // Spawn sur les bords de la room aléatoirement
    var _side = irandom(3)
    var _sx, _sy
    
    switch (_side) {
        case 0: _sx = irandom(room_width);  _sy = -32; break         // Haut
        case 1: _sx = irandom(room_width);  _sy = room_height + 32 break // Bas
        case 2: _sx = -32;                  _sy = irandom(room_height) break // Gauche
        case 3: _sx = room_width + 32;      _sy = irandom(room_height) break // Droite
    }
    
    var _mob = instance_create_layer(_sx, _sy, "Instances", mob_obj)
    
    // Rend les mobs plus forts à chaque vague
    _mob.hp     = 3 + wave         // +1 PV par vague
    _mob.hp_max = 3 + wave
    _mob.move_speed = 1.5 + (wave * 0.15) // De plus en plus rapide
}