extends Area2D

const Balloon = preload("res://dialogue/balloon.tscn")

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

var selectable = false

func action() -> void:
	var balloon: Node = Balloon.instantiate()
	get_tree().current_scene.add_child(balloon)
	balloon.start(dialogue_resource, dialogue_start)

func set_highlight(enabled: bool) -> void:
	var item = get_parent()
	
	if item.has_node("Sprite2D"):
		var sprite = item.get_node("Sprite2D")
		
		if enabled:
			sprite.modulate = Color(1.4, 1.4, 1.4, 1.0)
		else:
			sprite.modulate = Color(1,1,1,1)
