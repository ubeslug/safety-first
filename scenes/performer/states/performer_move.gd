extends State

class_name PerformerMove

@export var character: Performer
@export var move_speed: float = 200


func physics_update(delta):
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

func handle_input(event: InputEvent):
	if Input.is_action_pressed("performer_jump"):
		state_machine.change_state("performerjump")
