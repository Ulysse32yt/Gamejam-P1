// Initialiser les fichiers de données au démarrage du jeu
show_debug_message("GAME MANAGER: Starting data initialization...");

// Initialiser player_data.json
var appdata_player_path = "player_data.json";
var default_player_path = "datafiles/player_data.json";

show_debug_message("GAME MANAGER: Checking player data file...");

if (!file_exists(appdata_player_path)) {
    show_debug_message("GAME MANAGER: Player data file not found, creating from defaults...");
    
    if (file_exists(default_player_path)) {
        show_debug_message("GAME MANAGER: Reading default player data...");
        var default_file = file_text_open_read(default_player_path);
        if (default_file != -1) {
            var default_content = file_text_read_string(default_file);
            file_text_close(default_file);
            
            show_debug_message("GAME MANAGER: Default content: " + string(default_content));
            
            var appdata_file = file_text_open_write(appdata_player_path);
            if (appdata_file != -1) {
                file_text_write_string(appdata_file, default_content);
                file_text_close(appdata_file);
                show_debug_message("GAME MANAGER: Player data file created successfully!");
            } else {
                show_debug_message("GAME MANAGER: FAILED to create player data file!");
            }
        } else {
            show_debug_message("GAME MANAGER: FAILED to read default player data file!");
        }
    } else {
        show_debug_message("GAME MANAGER: Default player data file NOT FOUND!");
    }
} else {
    show_debug_message("GAME MANAGER: Player data file already exists");
}

// Initialiser ameliorations.json
var appdata_upgrade_path = "ameliorations.json";
var default_upgrade_path = "datafiles/ameliorations.json";

show_debug_message("GAME MANAGER: Checking ameliorations file...");

if (!file_exists(appdata_upgrade_path)) {
    show_debug_message("GAME MANAGER: Ameliorations file not found, creating from defaults...");
    
    if (file_exists(default_upgrade_path)) {
        show_debug_message("GAME MANAGER: Reading default ameliorations...");
        var default_file = file_text_open_read(default_upgrade_path);
        if (default_file != -1) {
            var default_content = file_text_read_string(default_file);
            file_text_close(default_file);
            
            show_debug_message("GAME MANAGER: Default ameliorations content length: " + string(string_length(default_content)));
            
            var appdata_file = file_text_open_write(appdata_upgrade_path);
            if (appdata_file != -1) {
                file_text_write_string(appdata_file, default_content);
                file_text_close(appdata_file);
                show_debug_message("GAME MANAGER: Ameliorations file created successfully!");
            } else {
                show_debug_message("GAME MANAGER: FAILED to create ameliorations file!");
            }
        } else {
            show_debug_message("GAME MANAGER: FAILED to read default ameliorations file!");
        }
    } else {
        show_debug_message("GAME MANAGER: Default ameliorations file NOT FOUND!");
    }
} else {
    show_debug_message("GAME MANAGER: Ameliorations file already exists");
}

show_debug_message("GAME MANAGER: Data initialization complete!");

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

nb_mobs_before_sentinel = 2
counter_mobs_before_sentinel = 0

start_next_wave()

// Initialiser tous les fichiers de données depuis datafiles vers appdata
function initialize_game_data_files() {
    // Initialiser player_data.json
    var appdata_player_path = "player_data.json";
    var default_player_path = "datafiles/player_data.json";
    
    if (!file_exists(appdata_player_path)) {
        show_debug_message("Player data file not found in appdata, creating from defaults...");
        if (file_exists(default_player_path)) {
            // Copier le fichier par défaut depuis datafiles vers appdata
            var default_file = file_text_open_read(default_player_path);
            if (default_file != -1) {
                var default_content = file_text_read_string(default_file);
                file_text_close(default_file);
                
                var appdata_file = file_text_open_write(appdata_player_path);
                if (appdata_file != -1) {
                    file_text_write_string(appdata_file, default_content);
                    file_text_close(appdata_file);
                    show_debug_message("Player data file created successfully in appdata");
                }
            }
        }
    } else {
        show_debug_message("Player data file already exists in appdata");
    }
    
    // Initialiser ameliorations.json
    var appdata_upgrade_path = "ameliorations.json";
    var default_upgrade_path = "datafiles/ameliorations.json";
    
    if (!file_exists(appdata_upgrade_path)) {
        show_debug_message("Ameliorations file not found in appdata, creating from defaults...");
        if (file_exists(default_upgrade_path)) {
            // Copier le fichier par défaut depuis datafiles vers appdata
            var default_file = file_text_open_read(default_upgrade_path);
            if (default_file != -1) {
                var default_content = file_text_read_string(default_file);
                file_text_close(default_file);
                
                var appdata_file = file_text_open_write(appdata_upgrade_path);
                if (appdata_file != -1) {
                    file_text_write_string(appdata_file, default_content);
                    file_text_close(appdata_file);
                    show_debug_message("Ameliorations file created successfully in appdata");
                }
            }
        }
    } else {
        show_debug_message("Ameliorations file already exists in appdata");
    }
}

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

function spawn_sentinel() {
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
    
    var _mob = instance_create_layer(_sx, _sy, "Instances", sentinel_obj)
    _mob.hp        = 2 + (wave*(wave+1))/2
    _mob.hp_max    = 2 + (wave*(wave+1))/2
    _mob.move_speed = 1.5 + (wave * 0.15)
}