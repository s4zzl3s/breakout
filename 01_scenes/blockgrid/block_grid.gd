class_name BlockGrid
extends Node2D



@export var block_scene: PackedScene
@export var h_size: int  = 8
@export var v_size: int  = 6

@export var gap: float = 10.0

var block: Block
var block_size: Vector2
var grid_width: float
var grid_height: float

@onready var h_array: Array
@onready var v_array: Array



func _ready() -> void:
	for i in range(v_size):
		v_array.append(h_array)
		for j in range(h_size):
			block = block_scene.instantiate()
			add_child(block)
			block.position.x = j * (block.block_col.shape.size.x + gap)
			block.position.y = i * (block.block_col.shape.size.y + gap)
			h_array.append(block)

	block_size = block.block_col.shape.size
	grid_width = h_size * block.block_col.shape.size.x + (h_size - 1) * gap
	grid_height = v_size * block.block_col.shape.size.y + (v_size - 1) * gap
