xSpeed = keyboard_check(vk_right) - keyboard_check(vk_left)
x += xSpeed*moveSpeed

ySpeed = keyboard_check(vk_down) - keyboard_check(vk_up)
y += ySpeed*moveSpeed
