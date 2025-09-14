extends State

class_name PerformerMove

@export var move_speed: float = 200

func physics_update(delta):
	var character = state_machine.get_parent()
	var direction = Input.get_axis("performer_left", "performer_right")
	
	if direction == 0:
		state_machine.change_state("performeridle")
	
	if not character.is_on_floor():
		state_machine.change_state("performerfall")
	
	character.velocity.x = direction * move_speed
	character.move_and_slide()

func enter():
	pass
	#print("entering move state")
