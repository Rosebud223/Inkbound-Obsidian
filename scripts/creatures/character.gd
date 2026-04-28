class_name Character extends CharacterBody2D

const speed = 100
var current_dir = "down"
var blinking = false

@onready var actionable_finder: Area2D = $Direction/ActionableFinder
var current_actionable: Area2D = null

func _physics_process(delta):
	if blinking:
		velocity = Vector2.ZERO
		move_and_slide()
		return
		
	player_movement(delta)
	update_actionable_highlight()

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			start_special()
			return
func update_actionable_highlight() -> void:
	var actionables = actionable_finder.get_overlapping_areas()
	var new_actionable: Area2D = null
	
	if actionables.size() > 0:
		new_actionable = actionables[0]
	
	if current_actionable == new_actionable:
		return
	
	if current_actionable != null and current_actionable.has_method("set_highlight"):
		current_actionable.set_highlight(false)
	
	current_actionable = new_actionable
	
	if current_actionable != null and current_actionable.has_method("set_highlight"):
		current_actionable.set_highlight(true)

func character():
	pass

func start_special():
	blinking = true
	velocity = Vector2.ZERO
	$AnimatedSprite2D.play("special")

func player_movement(delta):
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
		velocity.x = 0
		velocity.y = speed
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
		velocity.x = 0
		velocity.y = -speed
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()
	
func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		if movement == 1:
			anim.play("walk_south") # Replace with side walk
		elif movement == 0:
			anim.play("idle") # Replace with side idle
		#anim.flip_h = false (add when side animation is available)
	# Play side animation and flip if needed
	if dir == "left":
		if movement == 1:
			anim.play("walk_south") # Replace with side walk
		elif movement == 0:
			anim.play("idle") # Replace with side idle
		#anim.flip_h = true (add when side animation is available
	if dir == "down":
		if movement == 1:
			anim.play("walk_south")
		else:
			anim.play("idle") 
	if dir == "up":
		if movement == 1:
			anim.play("walk_north")
		else:
			anim.play("idle") # Replace with North Idle


func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.animation == "special":
		blinking = false
