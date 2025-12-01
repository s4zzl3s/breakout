class_name Paddle
extends CharacterBody2D

const SPEED = 300.0

var ball_mounted: bool = false
var ball: Ball

@export var ball_scene: PackedScene

@onready var col: CollisionShape2D = %CollisionShape2D

func _ready() -> void:
	create_ball()

func _physics_process(delta: float) -> void:
	# Move left and right
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED * delta
	else:
		velocity.x = 0
	
	move_and_collide(velocity)

	#Shoot ball if mounted
	if Input.is_action_just_pressed("shoot") and ball != null and ball_mounted:
		ball.position = ball.global_position
		ball.top_level = true
		ball.shoot()
		ball_mounted = false
	
func create_ball() -> void:
	ball = ball_scene.instantiate()
	add_child(ball)
	ball.top_level = false
	ball.position.y -= 30
	ball_mounted = true
