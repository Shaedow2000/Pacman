extends CharacterBody2D

const SPEED: float = 1000.0

@onready var borders: TileMapLayer = $"../../Borders"
@onready var game_map: TileMapLayer = $"../../GameMap"

@export var personality: int

var game

func _ready() -> void:
	add_to_group("phantom")
	game = $"../../"
	
func is_wall(cell: Vector2i) -> bool:
	var dataMap = game_map.get_cell_tile_data(cell)
	var dataBorders = borders.get_cell_tile_data(cell)
	
	if dataBorders != null and dataMap.get_custom_data("is_wall"):
		return true
	if dataMap != null and dataBorders.get_custom_data("is_wall"):
		return true
	
	return false

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
