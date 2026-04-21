if cooldown == 0 {
	other.lose_hp(damage)
	cooldown = attack_cooldown
}