extends CharacterBody2D

func _process(_delta):
	if global.hat_status == "gave":
		if $AnimatedSprite2D.animation != "special":
			$AnimatedSprite2D.play("special")
	else:
		if $AnimatedSprite2D.animation != "idle":
			$AnimatedSprite2D.play("idle")
