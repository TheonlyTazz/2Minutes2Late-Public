extends Node

# Level Scenes
@onready var level_kevin = preload("res://scenes/Level/Kevin.tscn") as PackedScene
@onready var level_leroy = preload("res://scenes/Level/Leroy.tscn") as PackedScene
@onready var level_malte = preload("res://scenes/Level/Malte.tscn") as PackedScene
@onready var level_marcel = preload("res://scenes/Level/Marcel.tscn") as PackedScene

@onready var level_jannek = preload("res://scenes/Level/Jannek.tscn") as PackedScene
@onready var level_adrian = preload("res://scenes/Level/Adrian.tscn") as PackedScene

# Level Passed Overlay Scene
@onready var level_passed_overlay = preload("res://scenes/Utils/ui_level_passed_overlay.tscn") as PackedScene
