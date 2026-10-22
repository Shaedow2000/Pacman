extends CanvasLayer

@export var game: Game

func _on_continue_pressed() -> void:
	game.continue_game()
func _on_exit_pressed() -> void:
	game.stop_game()
