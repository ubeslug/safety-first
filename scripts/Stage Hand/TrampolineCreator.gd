extends Node2D

@export var trampoline: Resource
@export var point: Resource
@export var dummy: Resource
var pointRef: Node2D

var pos1 = null

var trampCount = 0
@export var maxTramps = 3

func _physics_process(delta: float) -> void:
	# if point is made and cursor is too far, destroy point
		if(pos1):
			print(pos1.distance_to(get_global_mouse_position()))
			if(pos1.distance_to(get_global_mouse_position()) > 600):
				pos1 = null
				pointRef.queue_free()

# save position 1
# when position 2 is created, clear position 1 and create line between
func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index == MOUSE_BUTTON_LEFT:
			AddPoint(get_global_mouse_position())
		if event.button_index == MOUSE_BUTTON_RIGHT:
			var dumb = dummy.instantiate()
			dumb.global_position = get_global_mouse_position()
			add_child(dumb)

func AddPoint(pos):
	if(trampCount < maxTramps):
		if(pos1):
			var tramp = trampoline.instantiate()
			tramp.global_position = Vector2((pos1.x + pos.x) / 2, (pos1.y + pos.y) / 2)
			if(pos.x < pos1.x): # if second point is more left
				tramp.SetLine(pos, pos1)
			else:
				tramp.SetLine(pos1, pos)
			add_child(tramp)
			pos1 = null
			trampCount += 1
			tramp.connect("TrampolineDestroy", TrampolineDestroy)
			
			# delete "point"
			pointRef.queue_free()
		else:
			pos1 = pos
			# spawn "point"
			var point = point.instantiate()
			point.global_position = pos
			add_child(point)
			pointRef = point

func TrampolineDestroy():
	trampCount -= 1
