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
	
func get_paddle_normal(col_pos: Vector2) -> Vector2:
	var col_distance = col_pos - global_position
	var r = col_distance.x / (col.shape.size.x / 2)
	r = clamp(r, -1, 1)
	print(r)
	return Vector2.UP.rotated(deg_to_rad(45 * r))
