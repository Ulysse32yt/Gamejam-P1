// défiler les images
if (mouse_check_button_pressed(mb_left)) {
    lore_index++
    
    if (lore_index < array_length(lore_images)) {
        lore_sprite = lore_images[lore_index]
    } else {
		global.show_intro = false
        room_goto(MainMenu)
    }
}