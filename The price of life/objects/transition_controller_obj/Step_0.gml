// Clean up any stuck dividers if transition is 0
if transition = 0 {
	if (instance_exists(divider_top_obj)) {
		with (divider_top_obj) { instance_destroy(); }
	}
	if (instance_exists(divider_bottom_obj)) {
		with (divider_bottom_obj) { instance_destroy(); }
	}
}

if transition = 1 {
	// Only create dividers if they don't exist
	if (!instance_exists(divider_top_obj) && !instance_exists(divider_bottom_obj)) {
		instance_create_layer(0, -display_get_gui_height()/2, "Transitions", divider_top_obj)
		instance_create_layer(0, display_get_gui_height(), "Transitions", divider_bottom_obj)
		alarm[0] = 150
	}
}

if transition = 2 {
	room_goto(target_room);
	transition = 3;
}

