extends Control


@onready var start_button = $"MarginContainer/HBoxContainer/VBoxContainer/Start Level" as Button

@onready var exit_button = $"MarginContainer/HBoxContainer/VBoxContainer/Exit Level" as Button
enum Level{
	LEROY,
	MALTE,
	KEVIN,
	MARCEL,
	JANNEK,
	ADRIAN
}
@export var level: Level
var levelStr = "res://scenes/Level/Leroy.tscn"
# Called when the node enters the scene tree for the first time.
func _ready():
	start_button.button_down.connect(on_start_level_pressed)
	exit_button.button_down.connect(on_exit_button_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_start_level_pressed() -> void:
	match level:
		Level.LEROY:
			get_tree().change_scene_to_packed(Global.level_leroy)
		Level.MALTE:
			get_tree().change_scene_to_packed(Global.level_malte)
		Level.MARCEL:
			get_tree().change_scene_to_packed(Global.level_marcel)
		Level.KEVIN:
			get_tree().change_scene_to_packed(Global.level_kevin)
		Level.JANNEK:
			get_tree().change_scene_to_packed(Global.level_jannek)
		Level.ADRIAN:
			get_tree().change_scene_to_packed(Global.level_adrian)

func on_exit_button_pressed() -> void:
	get_tree().quit()
