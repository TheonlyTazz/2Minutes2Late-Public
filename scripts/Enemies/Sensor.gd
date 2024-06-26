extends Area2D
var player: CharacterBody2D
var in_range:bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_body_entered(body):
	if body.name == "Player":
		player = body
		in_range = true


func _on_body_exited(body):
	if body.name == "Player":
		in_range = false
		player = null
