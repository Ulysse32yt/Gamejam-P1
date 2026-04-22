image_xscale = 0.5
image_yscale = 0.5
speed = 10
direction = point_direction(x, y, mouse_x, mouse_y)

// Durée de vie de base + bonus d'amélioration
var base_lifetime = 60;
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

// Ancien système de compatibilité
if (instance_exists(shop_manager_obj)) {
    damage += shop_manager_obj.lvl_damage * 1
}