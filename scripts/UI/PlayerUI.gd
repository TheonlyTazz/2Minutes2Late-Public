extends CanvasLayer

@onready var ui: Control = $UI
@onready var health_component: HealthComponent = $"../HealthComponent"

func _process(delta):
	ui.get_child(0).get_child(0).text = "Health: " + str(health_component.health)
