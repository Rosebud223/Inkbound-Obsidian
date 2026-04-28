extends Node

var game_controller : GameController 

# Dialogue variables
var blocking = true
var open_door = false
# Corrat Conversation unlocks
var talked_about_catacombs = false
var talked_about_escape = false


# Basic inventory
var collected_items = {}
func collect_item(item_id: String) -> void:
	collected_items[item_id] = true

func has_item(item_id: String) -> bool:
	return collected_items.get(item_id, false)

func remove_item(item_id: String) -> void:
	if has_item(item_id):
		collected_items[item_id] = false
