action = ""

switch (action) {
	case "Play":
		room_goto(rm_game);
		break;
	case "Settings":
		room_goto(rm_settings);
		break;
	case "Shop":
		room_goto(rm_shop);
		break;
}