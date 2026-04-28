extends CharacterBody2D

func _process(float) -> void:
	$AnimatedSprite2D.play("idle")
