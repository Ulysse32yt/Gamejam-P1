if cooldown > 0 {
	draw_set_font(button_font)
	draw_set_color(c_white)
	
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	
	cx = display_get_gui_width() * 0.35
	cy = display_get_gui_height() * 0.1

	draw_text(cx, cy, "Not enough energy !")

}