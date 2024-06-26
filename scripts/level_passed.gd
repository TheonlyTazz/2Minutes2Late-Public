extends Area2D

func _ready():
	# Connect the signals
	self.connect("body_entered", Callable(self, "_on_body_entered"))
	self.connect("body_exited", Callable(self, "_on_body_exited"))

func _on_body_entered(body: Node):
	if body.name == "Player":
		var overlay = Global.level_passed_overlay.instantiate()
		if overlay:
			get_tree().root.add_child(overlay)
			overlay.set_position(Vector2(get_viewport().size.x / 2, get_viewport().size.y / 2))
			overlay.show()
			print("overlay gefunden")#
			print("Overlay position: ", overlay.position)
			print("Overlay visibility: ", overlay.visible)
		else:
			print("overlay nicht gefunden")
		get_tree().change_scene_to_packed(Global.level_leroy)

func _on_body_exited(body: Node):
	if body.name == "Player":
		print("Player exited the zone")
