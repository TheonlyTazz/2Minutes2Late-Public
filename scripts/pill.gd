extends Area2D


func _on_body_entered(_body):
	if _body.name != "Player": return
	print(name + " pickedup")
	queue_free()
