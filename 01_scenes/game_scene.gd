extends Node2D


@onready var left_bounds: CollisionShape2D = %LeftBounds
@onready var right_bounds: CollisionShape2D = %RightBounds
@onready var paddle: CharacterBody2D = %Paddle
@onready var top_bounds: CollisionShape2D = %TopBounds

@export var block_grid: BlockGrid



func _ready() -> void:
	left_bounds.position = get_viewport_rect().position
	right_bounds.position.x = get_viewport_rect().end.x
	top_bounds.position = get_viewport_rect().position
	paddle.position = Vector2(get_viewport_rect().end.x / 2, get_viewport_rect().end.y - 25.0)
	block_grid.position.x = (get_viewport_rect().end.x / 2) - (block_grid.grid_width / 2) + (block_grid.block_size.x / 2)
	block_grid.position.y = get_viewport_rect().position.y + 3 * block_grid.block_size.y



