extends CharacterBody2D

var game

func _ready() -> void:
	add_to_group("phantom")
	game = $"../../"

func game_over() -> void:
	game.game_lost()

func _on_phantom_1_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		game_over()

func _on_phantom_2_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		game_over()


func _on_phantom_3_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		game_over()

func _on_phantom_4_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		game_over()
