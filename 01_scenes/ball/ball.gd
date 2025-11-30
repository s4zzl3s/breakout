class_name Ball
extends CharacterBody2D

@export var speed: float = 150

var move_vector: Vector2 = Vector2.ZERO

func _ready() -> void:
	var random: Vector2 = Vector2(randi_range(-10,10), randi_range(-10,10)).normalized()
	velocity = random * speed


func _physics_process(delta: float) -> void:

	
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	#Handle bounce
	if collision:
		var collider: Object = collision.get_collider()
		if collider is Node and collider.is_in_group("Paddle") and collision.get_normal().dot(Vector2.UP) > 0.9:
			
			velocity = reflect(velocity, collider.get_paddle_normal(collision.get_position()))
		else:	
			velocity = reflect(velocity, collision.get_normal())

	move_and_collide(velocity * delta)


func reflect(vec_in: Vector2, normal: Vector2) -> Vector2:
	return vec_in - 2 * vec_in.dot(normal) * normal
