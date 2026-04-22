// Data Initialization Object - Create Event
show_debug_message("DATA INIT OBJ: Starting initialization...");

// Initialiser player_data.json
var appdata_player_path = "player_data.json";
var default_player_path = "datafiles/player_data.json";

show_debug_message("DATA INIT OBJ: Checking player data file...");

if (!file_exists(appdata_player_path)) {
    show_debug_message("DATA INIT OBJ: Player data file not found, creating from defaults...");
    
    // Utiliser les valeurs par défaut codées en dur
    show_debug_message("DATA INIT OBJ: Creating player data with hardcoded defaults...");
    var default_content = "{\"xp\":0,\"level\":0,\"total_xp_earned\":0}";
    
    show_debug_message("DATA INIT OBJ: Default content: " + string(default_content));
    
    var appdata_file = file_text_open_write(appdata_player_path);
    if (appdata_file != -1) {
        file_text_write_string(appdata_file, default_content);
        file_text_close(appdata_file);
        show_debug_message("DATA INIT OBJ: Player data file created successfully!");
    } else {
        show_debug_message("DATA INIT OBJ: FAILED to create player data file!");
    }
} else {
    // Vérifier si le fichier existant est valide
    show_debug_message("DATA INIT OBJ: Player data file exists, checking validity...");
    var existing_file = file_text_open_read(appdata_player_path);
    if (existing_file != -1) {
        var existing_content = file_text_read_string(existing_file);
        file_text_close(existing_file);
        
        if (existing_content == "" || string_length(existing_content) < 10) {
            show_debug_message("DATA INIT OBJ: Player data file is empty or invalid, recreating...");
            
            // Utiliser les valeurs par défaut codées en dur pour la recréation
            show_debug_message("DATA INIT OBJ: Recreating player data with hardcoded defaults...");
            var default_content = "{\"xp\":0,\"level\":0,\"total_xp_earned\":0}";
            
            var appdata_file = file_text_open_write(appdata_player_path);
            if (appdata_file != -1) {
                file_text_write_string(appdata_file, default_content);
                file_text_close(appdata_file);
                show_debug_message("DATA INIT OBJ: Player data file recreated successfully!");
            } else {
                show_debug_message("DATA INIT OBJ: FAILED to recreate player data file!");
            }
        } else {
            show_debug_message("DATA INIT OBJ: Player data file is valid");
        }
    } else {
        show_debug_message("DATA INIT OBJ: FAILED to read existing player data file!");
    }
}

// Initialiser ameliorations.json
var appdata_upgrade_path = "ameliorations.json";
var default_upgrade_path = "datafiles/ameliorations.json";

show_debug_message("DATA INIT OBJ: Checking ameliorations file...");

if (!file_exists(appdata_upgrade_path)) {
    show_debug_message("DATA INIT OBJ: Ameliorations file not found, creating from defaults...");
    
    // Utiliser les valeurs par défaut codées en dur
    show_debug_message("DATA INIT OBJ: Creating ameliorations with hardcoded defaults...");
    var default_content = "{\"ameliorations\":[{\"id\":\"lifetime\",\"description\":\"Augmente la durée de vie des projectiles\",\"niveau_max\":5,\"cout\":3,\"effet_par_niveau\":30,\"nom\":\"Lifetime\",\"niveau_actuel\":0},{\"id\":\"damage\",\"description\":\"Augmente les dégâts des projectiles\",\"niveau_max\":5,\"cout\":3,\"effet_par_niveau\":5,\"nom\":\"Damage\",\"niveau_actuel\":0},{\"id\":\"max_energy\",\"description\":\"Augmente l'énergie maximale\",\"niveau_max\":5,\"cout\":3,\"effet_par_niveau\":20,\"nom\":\"Max Energy\",\"niveau_actuel\":0},{\"id\":\"energy_recovery\",\"description\":\"Augmente la récupération d'énergie\",\"niveau_max\":5,\"cout\":3,\"effet_par_niveau\":2,\"nom\":\"Energy Recovery\",\"niveau_actuel\":0}],\"points_amelioration\":0}";
    
    show_debug_message("DATA INIT OBJ: Default ameliorations content length: " + string(string_length(default_content)));
    
    var appdata_file = file_text_open_write(appdata_upgrade_path);
    if (appdata_file != -1) {
        file_text_write_string(appdata_file, default_content);
        file_text_close(appdata_file);
        show_debug_message("DATA INIT OBJ: Ameliorations file created successfully!");
    } else {
        show_debug_message("DATA INIT OBJ: FAILED to create ameliorations file!");
    }
} else {
    // Vérifier si le fichier existant est valide
    show_debug_message("DATA INIT OBJ: Ameliorations file exists, checking validity...");
    var existing_file = file_text_open_read(appdata_upgrade_path);
    if (existing_file != -1) {
        var existing_content = file_text_read_string(existing_file);
        file_text_close(existing_file);
        
        if (existing_content == "" || string_length(existing_content) < 10) {
            show_debug_message("DATA INIT OBJ: Ameliorations file is empty or invalid, recreating...");
            
            // Utiliser les valeurs par défaut codées en dur pour la recréation
            show_debug_message("DATA INIT OBJ: Recreating ameliorations with hardcoded defaults...");
            var default_content = "{\"ameliorations\":[{\"id\":\"lifetime\",\"description\":\"Augmente la durée de vie des projectiles\",\"niveau_max\":5,\"cout\":3,\"effet_par_niveau\":30,\"nom\":\"Lifetime\",\"niveau_actuel\":0},{\"id\":\"damage\",\"description\":\"Augmente les dégâts des projectiles\",\"niveau_max\":5,\"cout\":3,\"effet_par_niveau\":5,\"nom\":\"Damage\",\"niveau_actuel\":0},{\"id\":\"max_energy\",\"description\":\"Augmente l'énergie maximale\",\"niveau_max\":5,\"cout\":3,\"effet_par_niveau\":20,\"nom\":\"Max Energy\",\"niveau_actuel\":0},{\"id\":\"energy_recovery\",\"description\":\"Augmente la récupération d'énergie\",\"niveau_max\":5,\"cout\":3,\"effet_par_niveau\":2,\"nom\":\"Energy Recovery\",\"niveau_actuel\":0}],\"points_amelioration\":0}";
            
            var appdata_file = file_text_open_write(appdata_upgrade_path);
            if (appdata_file != -1) {
                file_text_write_string(appdata_file, default_content);
                file_text_close(appdata_file);
                show_debug_message("DATA INIT OBJ: Ameliorations file recreated successfully!");
            } else {
                show_debug_message("DATA INIT OBJ: FAILED to recreate ameliorations file!");
            }
        } else {
            show_debug_message("DATA INIT OBJ: Ameliorations file is valid");
        }
    } else {
        show_debug_message("DATA INIT OBJ: FAILED to read existing ameliorations file!");
    }
}

show_debug_message("DATA INIT OBJ: Initialization complete!");
show_debug_message("DATA INIT OBJ: Destroying instance...");

instance_destroy();
