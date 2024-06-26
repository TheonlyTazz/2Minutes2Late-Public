extends State

class_name AttackingState

@export var attack_hitbox: attack_hitbox
@export var ground_state: State;

func _on_animation_tree_animation_finished(anim_name):
	next_state = ground_state;
	
func on_enter():
	attack_hitbox.monitoring = true

func on_exit():
	attack_hitbox.monitoring = false
