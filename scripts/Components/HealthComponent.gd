extends Node2D
class_name HealthComponent

@onready var health_label = $Health_Label
@onready var timer = $Timer

@export var animated_sprite_2d: AnimatedSprite2D

@export var maxHealth: float = 100
var health: float = maxHealth

@export var maxArmor: float = 100
var armor: float = maxArmor
#@onready var health_label = %HealthLabel

func _ready():
	health = maxHealth
	armor = maxArmor
	health_label.visible = false


func damage(damage: Attack): 
	if health <= 0: return
	health -= damage.attack_damage
	get_parent().velocity = (global_position - damage.attack_position).normalized() * damage.knockback_force
	health_label.visible = false
	health_label.text = str(health)+ "/" + str(maxHealth)
	
	timer.start(1)
	if health <= 0:
		get_parent().is_dying = true
		animated_sprite_2d.play("death")
	else:
		animated_sprite_2d.play("hurt")

		

	
	


func setHealth(newHealth):
	health = newHealth
func getHealth():
	return health

func setMaxHealth(newMaxHealth):
	maxHealth = newMaxHealth
func getMaxHealth():
	return maxHealth

func setArmor(newArmor):
	armor = newArmor
func getArmor():
	return armor

func setMaxArmor(newMaxArmor):
	maxArmor = newMaxArmor
func getMaxArmor():
	return maxArmor


func _on_timer_timeout():
	health_label.visible = false
	health_label.text = ""
	if health <= 0:
		get_parent().queue_free()
	
