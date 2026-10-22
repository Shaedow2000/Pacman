extends CharacterBody2D

func _ready() -> void:
	add_to_group("phantom")

func game_over() -> void:
	pass

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
