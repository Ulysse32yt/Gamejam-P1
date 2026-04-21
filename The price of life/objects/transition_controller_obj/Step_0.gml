if transition = 1 {
	if (!instance_exists(divider_top_obj) && !instance_exists(divider_bottom_obj)) {
		instance_create_layer(0, -display_get_gui_height()/2, "Transitions", divider_top_obj)
		instance_create_layer(0, display_get_gui_height(), "Transitions", divider_bottom_obj)
	}
}


if transition = 2 {
	room_goto(target_room){
		transition = 3
	}
}

