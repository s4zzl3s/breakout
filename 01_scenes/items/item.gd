class_name Item
extends Area2D


var speed: float = 125.0


func _ready() -> void:
	connect("body_entered", _on_body_entered)


func _physics_process(delta: float) -> void:
	position.y += speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body is Paddle:
		print("collected")
