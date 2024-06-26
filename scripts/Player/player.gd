extends CharacterBody2D
#@onready var collision: CollisionShape2D = $CollisionShape2D 
@onready var sprite: Sprite2D = $Sprite2D 
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var character_state_machine: CharacterStateMachine = $CharacterStateMachine
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var player_hit_box = $playerHitBox
@onready var attack_component = $attack_component
@onready var hitbox_component = $HitboxComponent

@export var direction = 1
@export var speed = 250.0




enum Character {
	BIKER,
	PUNK,
	CYBORG
}
@export var character: Character


var attacking = false;
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	var char = "Biker"
	if(character == Character.BIKER):
		char = "Biker"
	elif(character == Character.CYBORG):
		char = "Cyborg"
	elif(character == Character.PUNK):
		char = "Punk"
	
	
	
	animation_tree.active = true;
	var animations = animation_player.get_animation_list()
	for animation in animations:
		var ani = animation_player.get_animation(animation)
		var texture = ani.track_get_key_value(0, 0)
		ani.track_set_key_value(0, 0, load("res://assets/Player/" + char + "/"+animation.get_file()+".png"))

	
func _physics_process(delta):

	if not is_on_floor():
		velocity.y += gravity * delta

	if get_slide_collision_count() >= 4:
		position.x += -direction * 20

	# Movement
	var direction = Input.get_axis("move_left", "move_right")
	animation_tree.set("parameters/move/blend_position", direction)

	if direction > 0: #right
		sprite.flip_h = false
		player_hit_box.position.x = -11
		attack_component.scale.x = 1
		hitbox_component.scale.x = 1

	elif direction < 0: #left
		sprite.flip_h = true
		player_hit_box.position.x = 11
		attack_component.scale.x = -1
		hitbox_component.scale.x = -1
		
	
	if direction && character_state_machine.check_if_can_move():
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()

