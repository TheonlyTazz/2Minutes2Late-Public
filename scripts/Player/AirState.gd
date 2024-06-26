extends State

class_name AirState


@export var landing_state: State
@export var jump_velocity: int = -300.0
@export var double_jump_animation: String = "doublejump"
@export var landing_animation: String = "landing"

var has_double_jumped: bool = false;

func state_process(delta):
	if(character.is_on_floor()):
		next_state = landing_state


		

func state_input(event: InputEvent):
	if(event.is_action_pressed("jump") && !has_double_jumped):
		double_jump();

func on_exit():
	if(next_state == landing_state):
		playback.travel(landing_animation)
		has_double_jumped = false;



func double_jump():
	character.velocity.y = jump_velocity;
	has_double_jumped = true;
	playback.travel(double_jump_animation)
