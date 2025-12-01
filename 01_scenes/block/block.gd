class_name Block
extends StaticBody2D

signal destroyed

@export var block_col: CollisionShape2D

@export var item_array: Array


func destroy() -> void:
	emit_signal("destroyed")
	block_col.disabled = true
	if randi_range(1, 6) >= 5:
		var spawn_item: Item = item_array.pick_random().instantiate()
		get_tree().root.add_child(spawn_item)
		spawn_item.position = global_position
