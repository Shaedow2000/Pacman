extends CanvasLayer

@export var game: Game

func _on_start_game_pressed() -> void:
	game.start_game()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("start_game"):
		game.start_game()

func _on_exit_game_pressed() -> void:
	get_tree().quit()
