class_name Paddle
extends CharacterBody2D


const SPEED = 300.0
@onready var col: CollisionShape2D = %CollisionShape2D


func _physics_process(delta: float) -> void:
	
	var move_vector: Vector2 = Vector2.ZERO
	var direction := Input.get_axis("left", "right")
	if direction:
		move_vector.x = direction * SPEED * delta
	else:
		move_vector.x = 0

	move_and_collide(move_vector)
	
func get_paddle_normal() -> Vector2: 
	return Vector2.UP
