extends Area2D

class_name attack_hitbox
@export var damage: int = 10
@export var knockback: int = 100
@export var stuntime: int = 100

func _on_body_entered(body):
	print("entered body " + body.name)
	if body.has_node("HitboxComponent"):
		var hitbox = body.get_node("HitboxComponent")
		var attack = Attack.new()
		attack.attack_damage = damage
		attack.attack_position = global_position
		attack.knockback_force = knockback
		attack.stun_time = stuntime
		hitbox.damage(attack)
