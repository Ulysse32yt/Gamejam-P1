if swinging {
	if nb_hit_left > 0 {
		other.lose_hp(damage)
		if other.x < x {
			other.x -= 50
		} else {
			other.x += 50
		}
		nb_hit_left -= 1
	}
}