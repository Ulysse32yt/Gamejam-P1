// Charger les données du joueur depuis le JSON
function load_player_data() {
    var file_path = "datafiles/player_data.json";
    if (file_exists(file_path)) {
        var file = file_text_open_read(file_path);
        if (file != -1) {
            var json_string = file_text_read_string(file);
            file_text_close(file);
            if (json_string != "" && json_string != undefined) {
                try {
                    var player_data = json_parse(json_string);
                    if (player_data != undefined && player_data.xp != undefined) {
                        xp = player_data.xp;
                        global.player_level = player_data.level || 1;
                        global.total_xp_earned = player_data.total_xp_earned || 0;
                        show_debug_message("Player data loaded: XP=" + string(xp) + ", Level=" + string(global.player_level));
                        return;
                    }
                } catch(e) {
                    show_debug_message("Error parsing player data: " + string(e));
                }
            }
        } else {
            show_debug_message("Failed to open player data file for reading");
        }
    }
    
    // Valeurs par défaut si le fichier n'existe pas ou est corrompu
    xp = 0;
    global.player_level = 1;
    global.total_xp_earned = 0;
    show_debug_message("Using default player data");
}

// Sauvegarder les données du joueur
function save_player_data() {
    var file_path = "datafiles/player_data.json";
    var player_data = {
        "xp": xp,
        "level": global.player_level || 1,
        "total_xp_earned": global.total_xp_earned || 0
    };
    var json_string = json_stringify(player_data);
    var file = file_text_open_write(file_path);
    if (file != -1) {
        file_text_write_string(file, json_string);
        file_text_close(file);
        show_debug_message("Player data saved: XP=" + string(xp));
    } else {
        show_debug_message("Failed to open player data file for writing");
    }
}

xp_given = false;

// Fonction pour ajouter de l'XP (pour testing)
function add_xp(amount) {
    xp += amount;
    global.total_xp_earned += amount;
    save_player_data();
    show_debug_message("Added " + string(amount) + " XP. Total: " + string(xp));
}

// Charger les données au démarrage
load_player_data();