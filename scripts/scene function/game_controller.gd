class_name GameController extends Node2D


@onready var map : Node2D = $MapContainer
@onready var menu : Control = $"MenuCanvas/Main Menu"

var current_map_scene
var menu_open = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global.game_controller = self
	current_map_scene = $MapContainer/Catacomb1
	menu.visible = true

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		toggle_menu()

func toggle_menu() -> void:
	menu_open = !menu_open
	menu.visible = menu_open
	
	if menu_open:
		menu.open_main_menu()

func change_map_scene(new_scene: String, delete: bool = true, keep_running: bool = false) -> void:
	if current_map_scene != null:
		if delete:
			current_map_scene.queue_free() # Removes node entirely
		elif keep_running:
			current_map_scene.visible = false # Keeps in memory and running
		else:
			map.remove_child(current_map_scene) # Keeps in memory, does not run
	var new = load(new_scene).instantiate()
	map.add_child(new)
	current_map_scene = new
