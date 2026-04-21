var _gui_x = device_mouse_x_to_gui(0);
var _gui_y = device_mouse_y_to_gui(0);

// Check si le bouton energy est cliqué, obligé de le faire dans un step plutôt que
// un left pressed car ce dernier check le clic selon les coordonnées du bouton dans
// la room et pas sur l'écran
if (mouse_check_button_pressed(mb_left)) {
    if (point_in_rectangle(_gui_x, _gui_y, 0, 128, 128, 256)) {
		
		if energy < max_energy {
			if energy < max_energy - recup {
				energy += recup
			} else {
				energy = max_energy
			}
		}
    }
}