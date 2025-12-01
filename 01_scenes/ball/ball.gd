class_name Ball
extends CharacterBody2D

@export var base_speed: float = 150
@export var col: CollisionShape2D
@export var paddle: Paddle

var counter: int = 0

var move_vector: Vector2 = Vector2.ZERO



func _physics_process(delta: float) -> void:

	
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	#Handle bounce
	if collision:
		var col_normal = collision.get_normal() 
		var collider: Object = collision.get_collider()
		if collider is Node and collider.is_in_group("Paddle") and col_normal.dot(Vector2.UP) > 0.9:
			# Get relative collision position from paddle mid
			# and reflect back (between -45 and 45 degrees)
			counter = 0
			var col_distance: Vector2 = collision.get_position() - collider.global_position
			var r: float = col_distance.x / (collider.col.shape.size.x / 2)
			r = clamp(r, -1, 1)
			velocity = Vector2(r / 2, -0.5).normalized() * base_speed
			
		else:
			counter += 1
			velocity = reflect(velocity, col_normal)
			if collider is Node and collider.is_in_group("Block"):
				collider.destroy()
	

	move_and_collide(velocity * delta)


func reflect(vec_in: Vector2, normal: Vector2) -> Vector2:
	var vec_out: Vector2 = vec_in - 2 * vec_in.dot(normal) * normal
	var angle: float = rad_to_deg(vec_out.angle())
	if angle < 20 and angle > 0:
		vec_out = vec_out.rotated(deg_to_rad(20))
	elif angle < 0 and angle > -20:
		vec_out = vec_out.rotated(deg_to_rad(-20))
	elif angle < 200 and angle > 180:
		vec_out = vec_out.rotated(deg_to_rad(200))
	elif angle < 180 and angle > 160:
		vec_out = vec_out.rotated(deg_to_rad(160))
	print(rad_to_deg(vec_out.angle()))
	return vec_out

func shoot() -> void:
	var random = randi_range(0, 1)
	match random:
		0:
			velocity = Vector2(1,-1).normalized() * base_speed
		1:
			velocity = Vector2(-1,-1).normalized() * base_speed