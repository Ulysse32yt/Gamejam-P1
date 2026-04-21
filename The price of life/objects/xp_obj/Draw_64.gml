if (room == MainMenu || room == Shop) {
    var _gui_w = display_get_gui_width();
    
    draw_set_font(-1);
    draw_set_halign(fa_right);
    draw_set_color(c_yellow);
    draw_text(_gui_w - 20, 20, "XP : " + string(xp));
    
    draw_set_halign(fa_left);
    draw_set_color(c_white);
}