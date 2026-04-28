extends Node2D


func _on_catacomb_2_transition_body_entered(body: Node2D) -> void:
	if body.has_method("character"):
		global.game_controller.change_map_scene("res://scenes/maps/catacomb2.tscn")
