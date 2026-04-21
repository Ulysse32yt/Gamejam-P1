// Disparition progressive
lifetime--
if (lifetime <= 0) instance_destroy()

// Ramassage si le joueur touche la pièce
if (place_meeting(x, y, player_obj)) {
    // Ajoute le gold au game_manager
    with (game_manager_obj) {
        gold += other.value
    }
    instance_destroy()
}