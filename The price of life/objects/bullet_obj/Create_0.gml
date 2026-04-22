speed = 10
direction = point_direction(x, y, mouse_x, mouse_y)
image_angle = direction

// Durée de vie de base + bonus d'amélioration
var base_lifetime = 120;
if (variable_global_exists("upgrades_loaded") && global.upgrades_loaded && variable_global_exists("projectile_lifetime_bonus")) {
    alarm[0] = base_lifetime + global.projectile_lifetime_bonus;
} else {
    alarm[0] = base_lifetime;
}

// Dégâts de base + bonus d'amélioration
damage = 1;
if (variable_global_exists("upgrades_loaded") && global.upgrades_loaded && variable_global_exists("projectile_damage_bonus")) {
    damage += global.projectile_damage_bonus;
}