extends Node2D


@onready var left_bounds: CollisionShape2D = %LeftBounds
@onready var right_bounds: CollisionShape2D = %RightBounds
@onready var paddle: CharacterBody2D = %Paddle
@onready var top_bounds: CollisionShape2D = %TopBounds



func _ready() -> void:
	left_bounds.position = get_viewport_rect().position
	right_bounds.position.x = get_viewport_rect().end.x
	top_bounds.position = get_viewport_rect().position
	paddle.position = Vector2(get_viewport_rect().end.x / 2, get_viewport_rect().end.y)
