extends Area2D


@onready var timer = $Timer

func _on_body_entered(body):
	Engine.time_scale = 0.5
	#body.get_node("CollisionShape2D").queue_free()
	var animationTree: AnimationTree = body.get_node("AnimationTree")
	animationTree["parameters/playback"].travel("death")
	timer.start()
	
	
	
	

func _on_timer_timeout():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
