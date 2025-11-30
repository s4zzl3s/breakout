class_name Ball
extends CharacterBody2D

@export var speed: float = 150
@export var col: CollisionShape2D
@export var paddle: Paddle

var move_vector: Vector2 = Vector2.ZERO

func _ready() -> void:
	var random: Vector2 = Vector2(randi_range(-10,10), randi_range(-10,10)).normalized()
	velocity = random * speed


func _physics_process(delta: float) -> void:

	
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	#Handle bounce
	if collision:
		var col_normal = collision.get_normal() 
		var collider: Object = collision.get_collider()
		if collider is Node and collider.is_in_group("Paddle") and col_normal.dot(Vector2.UP) > 0.9:
			# Get relative collision position on paddle and reflect back (between -45 and 45 degrees)
			var col_distance: Vector2 = collision.get_position() - collider.global_position
			var r: float = col_distance.x / (collider.col.shape.size.x / 2)
			r = clamp(r, -1, 1)
			velocity = Vector2(r / 2, -0.5).normalized() * speed
			
		else:
			velocity = reflect(velocity, col_normal)

	move_and_collide(velocity * delta)


func reflect(vec_in: Vector2, normal: Vector2) -> Vector2:
	return vec_in - 2 * vec_in.dot(normal) * normal

