extends StaticBody2D

class_name Pickup

@export var item_id: String = ""

func _process(float) -> void:
	if global.has_item(item_id):
		queue_free()
