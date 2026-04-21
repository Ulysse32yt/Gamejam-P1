draw_self()

draw_sprite_ext(
    weapon,
    image_index,
    x - 150,
    y,
    -floor(image_xscale/3),
    floor(image_yscale/3),
    35,
    c_white,
    1
)

gpu_set_tex_filter(false)