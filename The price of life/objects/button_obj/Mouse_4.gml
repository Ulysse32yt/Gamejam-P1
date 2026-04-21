switch (action) {
	case "PLAY":
		transition_controller_obj.target_room = Room1
		transition_controller_obj.transition = 1
		break
	case "SETTINGS":
		transition_controller_obj.target_room = Settings
		transition_controller_obj.transition = 1
		break
	case "SHOP":
		transition_controller_obj.target_room = Shop
		transition_controller_obj.transition = 1
		break
}