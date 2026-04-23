extends Control

@onready var main_panel: Panel = $MainPanel
@onready var options_panel: Panel = $OptionsPanel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main_panel.visible = true
	options_panel.visible = false


func open_main_menu() -> void:
	main_panel.visible = true
	options_panel.visible = false

func close_menu() -> void:
	main_panel.visible = false
	options_panel.visible = false


func _on_resume_pressed() -> void:
	main_panel.visible = false
	options_panel.visible = false

func _on_options_pressed() -> void:
	main_panel.visible = false
	options_panel.visible = true


func _on_back_pressed() -> void:
	main_panel.visible = true
	options_panel.visible = false
