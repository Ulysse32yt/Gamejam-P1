if transition_controller_obj.transition = 1 {
	y = lerp(y, display_get_gui_height()/2-1, 0.05)
}

if transition_controller_obj.transition = 3 {
	y = lerp(y, display_get_gui_height(), 0.075)
	
	if (y >= display_get_gui_height() - 1) {
			transition_controller_obj.transition = 0
	        instance_destroy();
	    }

}