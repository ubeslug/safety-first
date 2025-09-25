extends State

class_name PerformerFall


@export var fall_move_speed: float = 425
@export var character: Performer
@export var gravity: float = 400 #character.performer_gravity

func physics_update(delta):
	
	var direction = Input.get_axis("performer_left", "performer_right")
	
	if character.is_on_floor() and direction != 0:
		state_machine.change_state("performerfall")
	elif character.is_on_floor() and direction == 0:
		state_machine.change_state("performeridle") 
	
	
	
	character.velocity.y += gravity * delta
	character.velocity.x = direction * fall_move_speed
	
	character.move_and_slide()

func handle_input(event: InputEvent):
	#if Input.is_action_pressed("performer_jump"):
	#	state_machine.change_state("performerjump")
	pass
