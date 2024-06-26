extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var sensor = $Sensor
@onready var BulletScene: PackedScene = preload("res://scenes/Components/EnemyBullet.tscn")
@onready var timer = $Timer
var is_dying: bool = false

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var player: CharacterBody2D

func _physics_process(delta):
	if !animated_sprite_2d.is_playing():
		animated_sprite_2d.play("idle")
	
	if sensor.in_range == true:
		if sensor.player.position.x < position.x:
			scale.x = -1
		else:
			scale.x = 1
		if timer.is_stopped():
			timer.start(0.5)
	

func spawn_bullet():
	# Create an instance of the bullet
	var bullet: Bullet = BulletScene.instantiate();
	bullet.position = animated_sprite_2d.position

	bullet.direction = scale.x
	
	add_child(bullet)
	
	


	


func _on_timer_timeout():
	if is_dying == false:
		animated_sprite_2d.play("shoot")
		spawn_bullet()
