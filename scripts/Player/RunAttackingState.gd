extends State

class_name RunAttackingState

@export var attack_hitbox: attack_hitbox

@export var air_state: State
@export var run_attacking_animation_name: String = "run_attack"
@export var jump_animation: String = "jump"
@export var jump_velocity = -300.0
@export var ground_state: State


func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == run_attacking_animation_name):
		next_state = ground_state;

func state_input(event: InputEvent):
	if (event.is_action_pressed("jump")):
		jump()

func jump():
	character.velocity.y = jump_velocity
	next_state = air_state
	playback.start(jump_animation)
	
func on_enter():
	attack_hitbox.monitoring = true

func on_exit():
	attack_hitbox.monitoring = false
