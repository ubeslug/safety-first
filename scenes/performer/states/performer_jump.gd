extends State

class_name PerformerJump

@export var character: Performer
@export var jump_velocity: float
@export var gravity: float = 400
@export var fall_move_speed: float = 400

func enter():
	#print("jumping")
	jump(jump_velocity)

func update(delta):
	if character.velocity.y >= 0:
		state_machine.change_state("performerfall")

func physics_update(delta):
	character.velocity.y += gravity * delta
	
	var direction = Input.get_axis("performer_left", "performer_right")
	
	if character.is_on_floor() and direction != 0:
		state_machine.change_state("performeridle")
	elif character.is_on_floor() and direction == 0:
		state_machine.change_state("performeridle") 
	
	character.velocity.x = direction * fall_move_speed
	
	character.move_and_slide()

func handle_input(event: InputEvent):
	#if Input.is_action_pressed("performer_jump"):
	#	jump(jump_velocity)
	pass

func jump(jump_force: float):
	character.velocity.y = (jump_velocity * -1)
