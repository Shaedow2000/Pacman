extends CharacterBody2D

const SPEED: int = 3000.0

var direction: String

func _physics_process(delta: float) -> void:
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
