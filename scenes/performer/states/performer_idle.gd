extends State

class_name PerformerIdle


func enter():
	pass
	#print("Performer entering idle state")

func update(delta):
	var character = state_machine.get_parent()
	if (Input.is_action_pressed("performer_left") or Input.is_action_just_pressed("performer_right")) and character.is_on_floor():
		state_machine.change_state("performermove")
	elif not character.is_on_floor():
		state_machine.change_state("performerfall")

func handle_input(event: InputEvent):
	if Input.is_action_pressed("performer_jump"):
		state_machine.change_state("performerjump")
	
