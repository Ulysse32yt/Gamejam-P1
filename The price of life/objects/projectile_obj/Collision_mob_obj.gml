other.hp -= damage;

instance_destroy();

if (other.hp <= 0) {
    instance_destroy(other);
}