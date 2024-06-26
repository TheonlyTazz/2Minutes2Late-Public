extends CharacterBody2D

# Geschwindigkeitsvariablen
@export var speed: float = 2000.0
@export var raycast_distance: float = 50.0  # Erhöhe die Distanz, um sicherzustellen, dass der Raycast weit genug nach unten zeigt

# Richtung des NPC
var direction: Vector2 = Vector2(1, 0)

# Referenzen auf Knoten
@onready var raycast = $RayCast2D
@onready var label = $Label
@onready var interaction_area = $Area2D

# Variable, um zu verfolgen, ob der Spieler in der Nähe ist
var player_in_range = false

# Dialogzeilen
var dialog_lines = [
	"Hallo, wie geht's?",
	"Schöner Tag heute!",
	"Pass auf, wohin du gehst!",
	"Hast du etwas interessantes gehört?",
	"Viel Glück auf deinem Abenteuer!"
]

func _ready():
	# RayCast2D initialisieren
	raycast.target_position = Vector2(0, raycast_distance)  # Nach unten zeigen
	raycast.enabled = true
	label.visible = false  # Verstecke das Label initial

	# Verbindungssignale für die Interaktionsfläche
	interaction_area.body_entered.connect(_on_body_entered)
	interaction_area.body_exited.connect(_on_body_exited)

func _physics_process(delta):
	# Bewegung des NPC
	$AnimatedSprite2D.play("walk")
	velocity = direction * speed * delta
	move_and_slide()

	# Aktualisiere die horizontale Position des RayCast2D relativ zur Bewegungsrichtung des NPC
	raycast.position.x = direction.x * 10
	if not raycast.is_colliding():
		# Richtung umkehren
		direction.x *= -1
		# NPC umdrehen
		$AnimatedSprite2D.flip_h = !($AnimatedSprite2D.flip_h)
		# RayCast2D umkehren
		raycast.position.x *= -1

func _input(event):
	if player_in_range and event.is_action_pressed("use"):  # "ui_select" ist standardmäßig auf "E" gesetzt
		show_random_dialog()

func _on_body_entered(body):
	if body.name == "Player":  # Ersetze "Player" durch den Namen deines Spieler-Nodes
		player_in_range = true

func _on_body_exited(body):
	if body.name == "Player":  # Ersetze "Player" durch den Namen deines Spieler-Nodes
		player_in_range = false
		label.visible = false;
		
func show_random_dialog():
	#TODO: remove for loop (centering only works after second time)
	for i in 2:
		var random_index = int(randi() % dialog_lines.size())
		label.text = dialog_lines[random_index]
		# Warte auf den nächsten Frame, um sicherzustellen, dass die Größe des Labels aktualisiert wird
		await get_tree().create_timer(0.01).timeout
		label.position = Vector2(-label.size.x / 2, -label.size.y - 10)  # Zentriere das Label über dem NPC
		label.visible = true  # Zeige das Label an
