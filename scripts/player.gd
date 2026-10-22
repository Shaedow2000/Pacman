class_name Player
extends CharacterBody2D

const SPEED: int = 3000.0

@export var score_label: CanvasLayer
@export var win_hud: CanvasLayer

var direction: String
var score: int = 0

@export var game: Node

func _ready() -> void:
	add_to_group("player")

func _physics_process(delta: float) -> void:
	if not game.is_game_started():
		velocity = Vector2.ZERO
		return

	if Input.is_action_just_pressed("move_up"):
		direction = "up"
	if Input.is_action_just_pressed("move_down"):
		direction = "down"
	if Input.is_action_just_pressed("move_right"):
		direction = "right"
	if Input.is_action_just_pressed("move_left"):
		direction = "left"
		
	if direction == "up":
		velocity.y = -SPEED * delta
		velocity.x = 0
		$AnimatedSprite2D.rotation = -PI/2
	if direction == "down":
		velocity.y = SPEED * delta
		velocity.x = 0
		$AnimatedSprite2D.rotation = PI/2
	if direction == "right":
		velocity.x = SPEED * delta
		velocity.y = 0
		$AnimatedSprite2D.rotation = 0
	if direction == "left":
		velocity.x = -SPEED * delta
		velocity.y = 0
		$AnimatedSprite2D.rotation = PI

	move_and_slide()
	
func increment_score() -> void:
	score += 1
	score_label.increment_score(score)
	
	if score == 42:
		win_hud.show_win_screen()
