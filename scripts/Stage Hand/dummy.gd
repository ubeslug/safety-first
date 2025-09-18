class_name Player extends CharacterBody2D

func _physics_process(delta: float) -> void:
	# Add gravity.
	velocity += get_gravity() * delta

	move_and_slide()
