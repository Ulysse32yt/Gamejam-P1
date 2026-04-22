if swinging {
	if nb_hit_left > 0 {
		other.lose_hp(damage)
		nb_hit_left -= 1
	}
}