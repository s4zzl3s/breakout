class_name Paddle
extends CharacterBody2D


const SPEED = 300.0
@onready var col: CollisionShape2D = %CollisionShape2D


func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED * delta
	else:
		velocity.x = 0

	move_and_collide(velocity)
	
