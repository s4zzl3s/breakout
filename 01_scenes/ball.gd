class_name Ball
extends CharacterBody2D

@export var speed: float = 200

var move_vector: Vector2 = Vector2.ZERO

func _ready() -> void:
	var random: Vector2 = Vector2(randi_range(-10,10), randi_range(-10,10)).normalized()
	velocity = random * speed


func _physics_process(delta: float) -> void:

	
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	#Handle bounce
	##TODO Add exception for player collision
	if collision:
		print(collision.get_collider().get_class())
		if collision.get_collider().has_method("get_paddle_normal"):
			print("yes")
		else:
			var reflect = collision.get_remainder().bounce(collision.get_normal())
			velocity = velocity.bounce(collision.get_normal())
			move_and_collide(reflect)
