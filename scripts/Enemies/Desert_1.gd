extends Node2D

const SPEED = 60
@export var raycast_distance: float = 50.0  # Erhöhe die Distanz, um sicherzustellen, dass der Raycast weit genug nach unten zeigt
var direction = 1

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var raycast = $RayCastRight

func _onready():
		# RayCast2D initialisieren
	raycast.target_position = Vector2(0, raycast_distance)  # Nach unten zeigen
	raycast.enabled = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !animated_sprite_2d.is_playing():
		animated_sprite_2d.play("walk")
	# Aktualisiere die horizontale Position des RayCast2D relativ zur Bewegungsrichtung des NPC
	raycast.position.x = direction.x * 10
	if not raycast.is_colliding():
		# Richtung umkehren
		direction.x *= -1
		# NPC umdrehen
		$AnimatedSprite2D.flip_h = !($AnimatedSprite2D.flip_h)
		# RayCast2D umkehren
		raycast.position.x *= -1
	
	position.x += direction * SPEED * delta
