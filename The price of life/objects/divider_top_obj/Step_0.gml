var controller = instance_exists(transition_controller_obj) ? instance_find(transition_controller_obj, 0) : noone;

if controller != noone && controller.transition = 1 {
	y = lerp(y, 1, 0.05)
}

if controller != noone && controller.transition = 3 {
	y = lerp(y, -display_get_gui_height()/2, 0.075)
	
	if (y <= -display_get_gui_height()/2) {
	        instance_destroy();
			controller.transition = 0;
	    }

}