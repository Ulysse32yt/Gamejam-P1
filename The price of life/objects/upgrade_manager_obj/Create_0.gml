// Upgrade Manager - Create Event
global.upgrade_data = {};
global.upgrades_loaded = false;

// Initialiser les fichiers d'améliorations depuis datafiles vers appdata si inexistants
function initialize_upgrade_files() {
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
    }
}

// Charger les données d'améliorations depuis le JSON
function load_upgrades() {
    var file_path = "ameliorations.json";
    
    if (file_exists(file_path)) {
        var file = file_text_open_read(file_path);
        if (file != -1) {
            var json_string = file_text_read_string(file);
            file_text_close(file);
            
            if (json_string != "" && json_string != undefined && string_length(json_string) > 10) {
                try {
                    var upgrade_data = json_parse(json_string);
                    if (upgrade_data != undefined && upgrade_data.ameliorations != undefined) {
                        global.upgrade_data = upgrade_data;
                        global.upgrades_loaded = true;
                        show_debug_message("Upgrades loaded successfully");
                        return;
                    }
                } catch(e) {
                    show_debug_message("Error parsing upgrade data: " + string(e));
                    show_debug_message("JSON content was: " + string(json_string));
                }
            } else {
                show_debug_message("Ameliorations file is empty or invalid");
            }
        } else {
            show_debug_message("Failed to open ameliorations file for reading");
        }
    } else {
        show_debug_message("Ameliorations file does not exist");
    }
    
    // Utiliser les valeurs par défaut si le chargement échoue
    global.upgrade_data = {
        "ameliorations": [
            {"id":"lifetime","description":"Augmente la durée de vie des projectiles","niveau_max":5,"cout":3,"effet_par_niveau":30,"nom":"Lifetime","niveau_actuel":0},
            {"id":"damage","description":"Augmente les dégâts des projectiles","niveau_max":5,"cout":3,"effet_par_niveau":5,"nom":"Damage","niveau_actuel":0},
            {"id":"max_energy","description":"Augmente l'énergie maximale","niveau_max":5,"cout":3,"effet_par_niveau":20,"nom":"Max Energy","niveau_actuel":0},
            {"id":"energy_recovery","description":"Augmente la récupération d'énergie","niveau_max":5,"cout":3,"effet_par_niveau":2,"nom":"Energy Recovery","niveau_actuel":0}
        ],
        "points_amelioration": 0
    };
    global.upgrades_loaded = true;
    show_debug_message("Using default upgrade data");
}

// Sauvegarder les données d'améliorations
function save_upgrades() {
    if (!global.upgrades_loaded) return;
    
    var file_path = "ameliorations.json";
    var json_string = json_stringify(global.upgrade_data);
    file_text_write_string(file_path, json_string);
}

// Appliquer les effets des améliorations
function apply_upgrade_effects() {
    if (!global.upgrades_loaded) return;
    
    // Réinitialiser les variables globales d'amélioration
    global.lifetime_bonus = 0;
    global.damage_bonus = 0;
    global.max_energy_bonus = 0;
    global.energy_recovery_bonus = 0;
    
    // Appliquer les bonus selon les niveaux d'amélioration
    var ameliorations = global.upgrade_data.ameliorations;
    for (var i = 0; i < array_length(ameliorations); i++) {
        var amel = ameliorations[i];
        var niveau = amel.niveau_actuel;
        
        switch (amel.id) {
            case "lifetime":
                global.lifetime_bonus += niveau * amel.effet_par_niveau;
                break;
            case "damage":
                global.damage_bonus += niveau * amel.effet_par_niveau;
                break;
            case "max_energy":
                global.max_energy_bonus += niveau * amel.effet_par_niveau;
                break;
            case "energy_recovery":
                global.energy_recovery_bonus += niveau * amel.effet_par_niveau;
                break;
        }
    }
}

// Initialiser les améliorations au démarrage
load_upgrades();
