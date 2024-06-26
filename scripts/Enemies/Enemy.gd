extends Node2D
class_name HitboxComponent

@onready var ray_cast_right = $rayCastRight
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@export var SPEED = 50;
@export var hp = 100;
var BulletScene: PackedScene = preload("res://scenes/Components/Bullet.tscn")
var hurt = false
enum Mode{
	IDLE = 1,
	WALKING = 2,
	SHOOTING = 3
}

var negScale = Vector2(-1, 1)

enum Desert{
	EIN = 1, 
	ZWEI = 2,
	DREI = 3, 
	VIER = 4, 
	FÜNF = 5, 
	SECHS = 6
}
@export var desert_enemy: Desert
var direction = 1;


var health = 100
var taking_damage = false
var velocity = 0

func _ready():
	animated_sprite_2d.play("walk")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if !animated_sprite_2d.is_playing():
		animated_sprite_2d.play("walk")
	if ray_cast_right.is_colliding():
		if scale.x == -1:
			scale.x = 1
		else: scale.x = -1
		direction = direction * -1


	position.x += SPEED * delta * direction
	if $HealthComponent.health <= 0:
		SPEED = 0
		animated_sprite_2d.play("death")


func _on_hurtbox_child_entered_tree(node):
	print(node)

func _on_viewbox_body_entered(body):
	print("Someone is in my Sight!")
	
	

func _on_viewbox_body_exited(body):
	print("Lost Sight!")
	
	





func _on_front_raycast_body_entered(body):
	print(body)
	scale.x = -1
	direction = direction * -1
