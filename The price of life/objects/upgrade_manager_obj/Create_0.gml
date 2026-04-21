// Upgrade Manager - Create Event
global.upgrade_data = {};
global.upgrades_loaded = false;

// Charger les données d'améliorations depuis le JSON
function load_upgrades() {
    var file_path = "datafiles/ameliorations.json";
    var json_string = file_text_read_to_string(file_path);
    
    if (json_string != "") {
        global.upgrade_data = json_parse(json_string);
        global.upgrades_loaded = true;
        show_debug_message("Upgrades loaded successfully");
    } else {
        show_debug_message("Failed to load upgrades file");
    }
}

// Sauvegarder les données d'améliorations
function save_upgrades() {
    if (!global.upgrades_loaded) return;
    
    var file_path = "datafiles/ameliorations.json";
    var json_string = json_stringify(global.upgrade_data);
    file_text_write_string(file_path, json_string);
}

// Initialiser les améliorations au démarrage
load_upgrades();
