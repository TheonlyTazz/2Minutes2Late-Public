extends Node2D
class_name Bullet

@export var SPEED:int = 100

@export var SCALE:int = 4
@onready var attack_component = $attack_component
@export var damage: int = 10
@export var knockback: int = 100
@export var stuntime: int = 100

var direction = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	self.scale = Vector2(SCALE, SCALE)
	attack_component.damage = damage
	attack_component.knockback = knockback
	attack_component.stuntime = stuntime


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2(SPEED * delta * direction, 0)
	
	


func _on_attack_component_body_entered(body):
	if body.name != get_parent().name:
		attack_component._on_body_entered(body)
		print("bullet dying")
		queue_free()
