extends State

class_name PerformerFall

@export var gravity: float = 500
@export var fall_move_speed: float = 425



func physics_update(delta):
	var character = state_machine.get_parent()
	var direction = Input.get_axis("performer_left", "performer_right")
	
	if character.is_on_floor() and direction != 0:
		state_machine.change_state("performerfall")
	elif character.is_on_floor() and direction == 0:
		state_machine.change_state("performeridle") 
	
	
	character.velocity.y = gravity
	character.velocity.x = direction * fall_move_speed
	
	character.move_and_slide()
