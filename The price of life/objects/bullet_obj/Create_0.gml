speed = 10
direction = point_direction(x, y, mouse_x, mouse_y)
image_angle = direction

// Durée de vie de base + bonus d'amélioration
var base_lifetime = 120;
if (global.upgrades_loaded && global.projectile_lifetime_bonus != undefined) {
    alarm[0] = base_lifetime + global.projectile_lifetime_bonus;
} else {
    alarm[0] = base_lifetime;
}

// Dégâts de base + bonus d'amélioration
damage = 1;
if (global.upgrades_loaded && global.projectile_damage_bonus != undefined) {
    damage += global.projectile_damage_bonus;
}