extends State

class_name ShootingState

var BulletScene: PackedScene = preload("res://scenes/Components/Bullet.tscn")

@export var ground_state: State;



func _on_animation_tree_animation_finished(anim_name):
	next_state = ground_state;


func on_enter():
	spawn_bullet();
	next_state = ground_state
	
func spawn_bullet():
	# Create an instance of the bullet
	var bullet = BulletScene.instantiate();
	
	# Set the bullet's position to the player's position or the position of the shoot point
	bullet.position = character.global_position  # Adjust the position accordingl
	bullet.position.y += character.sprite.position.y/1.5
	if character.sprite.flip_h == true:
		bullet.direction = -1

	# Add the bullet to the scene tree
	get_parent().add_child(bullet)
