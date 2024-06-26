extends State

class_name GroundState
@export var jump_velocity = -300.0
@export var air_state: State
@export var attack_state: State
@export var run_attack_state: State
@export var shoot_state: State
@export var jump_animation: String = "jump"

func state_input(event: InputEvent):

	if(event.is_action_pressed("jump")):
		jump()
	if(event.is_action_pressed("attack")):
		if(character.velocity.x == 0):
			#attack()
			shoot()
		else:
			runAttack()

func jump():
	character.velocity.y = jump_velocity
	next_state = air_state
	playback.travel(jump_animation)

func attack():
	next_state = attack_state
	playback.travel("attack1")

func runAttack():
	next_state = run_attack_state
	playback.travel("run_attack")
	
func shoot():
	next_state = shoot_state
	
	
