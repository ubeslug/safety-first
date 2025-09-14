extends State

class_name PerformerIdle

func enter():
	pass
	#print("Performer entering idle state")

func handle_input(event: InputEvent):
	if Input.is_action_pressed("performer_left") or Input.is_action_just_pressed("performer_right"):
		state_machine.change_state("performermove")
	
	pass
