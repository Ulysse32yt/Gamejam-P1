var controller = instance_exists(transition_controller_obj) ? instance_find(transition_controller_obj, 0) : noone;

switch (action) {
	case "PLAY":
		controller.target_room = Room1;
		controller.transition = 1;
		break
	case "SETTINGS":
		controller.target_room = Settings;
		controller.transition = 1;
		break
	case "SHOP":
		controller.target_room = Shop;
		controller.transition = 1;
		break
}