// Clean up any leftover dividers when entering a new room
if (instance_exists(divider_top_obj)) {
    with (divider_top_obj) { instance_destroy(); }
}
if (instance_exists(divider_bottom_obj)) {
    with (divider_bottom_obj) { instance_destroy(); }
}

// Reset transition state to ensure clean start
transition = 0;
