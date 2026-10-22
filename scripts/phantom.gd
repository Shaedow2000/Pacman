extends CharacterBody2D

@export var SPEED: float

@onready var borders: TileMapLayer = $"../../NavigationRegion2D/Borders"
@onready var game_map: TileMapLayer = $"../../NavigationRegion2D/GameMap"

@export var personality: int

var game
@onready var player: CharacterBody2D = $"../../../Player"

var tile0: Vector2

func _ready() -> void:
	add_to_group("phantom")
	game = $"../../"
	await get_tree().physics_frame
	$NavigationAgent2D.target_position = player.global_position
	
func is_wall(cell: Vector2i) -> bool:
	var dataMap = game_map.get_cell_tile_data(cell)
	var dataBorders = borders.get_cell_tile_data(cell)
	
	if dataMap != null and dataMap.get_custom_data("is_wall"):
		return true
	if dataBorders != null and dataBorders.get_custom_data("is_wall"):
		return true
	
	return false
	
func _physics_process(delta: float) -> void:
	if not game.is_game_started():
		velocity = Vector2.ZERO
		return 

	if not $NavigationAgent2D.is_navigation_finished():
		var map = $NavigationAgent2D.get_navigation_map()
		var next_position = $NavigationAgent2D.get_next_path_position()
		var direction = global_position.direction_to(next_position)
		velocity = SPEED * direction
	else:
		velocity = Vector2.ZERO
		
	move_and_slide()

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
		
func get_target() -> Vector2:
	var chaser_target: Vector2 = player.global_position
	var ambusher_target: Vector2 = player.global_position + player.velocity.normalized() * 100
	
	match personality:
		0: return chaser_target
		3: return ambusher_target
		
	return player.global_position

func _on_timer_timeout() -> void:
	$NavigationAgent2D.target_position = get_target()
