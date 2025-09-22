extends Node2D

signal TrampolineDestroy

var durability: int = 0
var maxDurability: int = 3 # how many times it can be jumped on
@export var degradeTime: float = 7 # how long until it disappears, reset if jumped on
var bounceAngle
var strength

@onready var timer = $Timer

func _ready() -> void:
	timer.wait_time = degradeTime
	timer.start()
	
	durability = maxDurability

func SetLine(pos1: Vector2, pos2: Vector2) -> void:
	# stretch to fit position between 2 points
	var dist = pos1.distance_to(pos2)
	var scaleTo = (dist / $Sprite.texture.get_size().x) * $".".scale.x
	scaleTo = clamp(scaleTo, 1, 4) # min: 1, max: 4
	$".".scale.x *= scaleTo

	look_at(pos2) # point in pos2 direction
	
	# calculate bounce angle in radians
	bounceAngle = snapped(pos1.angle_to_point(pos2) - deg_to_rad(90), 0.0001)
	
	# calculate strength: wider = weaker, smaller = stronger
	strength = (4500 / dist) * 40 # random function for strength
	strength = clamp(strength, 500, 800)
	print("bounceAngle: ", rad_to_deg(bounceAngle), "  strength: " , strength)

func DecreaseDurability() -> void:
	durability -= 1
	$Sprite.self_modulate.a = float(durability) / maxDurability # fade in opacity
	if durability <= 0:
		RemoveTrampoline()
	
	timer.start() # reset timer

func _on_timer_timeout() -> void:
	RemoveTrampoline()

func RemoveTrampoline() -> void:
	emit_signal("TrampolineDestroy") # add 1 more trampoline for available spawn
	queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body is Player):
		body.velocity += Vector2.from_angle(bounceAngle) * strength # angle(radians) * strength
		DecreaseDurability()
