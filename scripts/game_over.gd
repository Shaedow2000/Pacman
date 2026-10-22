extends CanvasLayer

@export var game: Game

func _on_main_menu_pressed() -> void:
	game.stop_game()
