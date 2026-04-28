extends CharacterBody2D

@export var move_speed = 30
@export var target_position: Vector2

func _process(_delta):
	if global.has_item("given_hat"):
		if $AnimatedSprite2D.animation != "special":
			$AnimatedSprite2D.play("special")
	else:
		$AnimatedSprite2D.play("idle")

	if global.blocking == false:
		move_aside()

func move_aside():
	var distance_to_target = global_position.distance_to(target_position)
	
	if distance_to_target < 2:
		global_position = target_position
		velocity = Vector2.ZERO
		return
	
	var direction = global_position.direction_to(target_position)
	velocity = direction * move_speed
	
	move_and_slide()
