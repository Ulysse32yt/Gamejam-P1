other.hp -= damage
instance_destroy()

if (other.hp <= 0) {
    // Fait spawner une pièce à la position du mob
    instance_create_layer(other.x, other.y, "Instances", gold_obj)
    instance_destroy(other)
}