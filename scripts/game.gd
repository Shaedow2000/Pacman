class_name Game
extends Node

@export var game_start: bool = false

@export var score_label: CanvasLayer
@export var main_hud: CanvasLayer

func _ready() -> void:
	score_label.hide()

func start_game() -> void:
	game_start = true
	score_label.show()
	main_hud.queue_free()

func stop_game() -> void:
	game_start = false
	get_tree().reload_current_scene()
