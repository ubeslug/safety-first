extends Node2D

var durability: int = 0
var maxDurability: int = 3 # how many times it can be jumped on
@export var degradeTime: float = 6.5 # how long until it disappears, reset if jumped on
var angle
var strength

@onready var timer = $Timer

func _ready() -> void:
	timer.wait_time = degradeTime
	timer.start()
	
	durability = maxDurability

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index == MOUSE_BUTTON_RIGHT:
			Bounce()

func SetLine(pos1: Vector2, pos2: Vector2):
	# stretch to fit position between 2 points
	var dist = pos1.distance_to(pos2)
	var scaleTo = (dist / $Sprite.texture.get_size().x) * $".".scale.x
	$".".scale.x *= scaleTo

	look_at(pos2) # point in pos2 direction
	
	# flip if created backwards
	if pos2.x < pos1.x:
		$Sprite.flip_v = true
	
	# calculate angle
	
	# calculate strength

func Bounce():
	durability -= 1
	$Sprite.self_modulate.a = float(durability) / maxDurability # fade in opacity
	if durability <= 0:
		RemoveTrampoline()
	
	timer.start() # reset timer

func _on_timer_timeout() -> void:
	RemoveTrampoline()

func RemoveTrampoline():
	# send event to add 1 more trampoline for available spawn
	queue_free()
