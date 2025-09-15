extends Node2D

@export var trampoline: Resource
@export var point: Resource
var pointRef: Node2D

var pos1 = null

var trampCount = 0
@export var maxTramps = 6

# save position 1
# when position 2 is created, clear position 1 and create line between
func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index == MOUSE_BUTTON_LEFT:
			AddPoint(get_global_mouse_position())

func AddPoint(pos):
	if(trampCount < maxTramps):
		if(pos1):
			var tramp = trampoline.instantiate()
			tramp.global_position = Vector2((pos1.x + pos.x) / 2, (pos1.y + pos.y) / 2)
			tramp.SetLine(pos1, pos)
			add_child(tramp)
			pos1 = null
			trampCount += 1
			
			# delete "point"
			pointRef.queue_free()
		else:
			pos1 = pos
			# spawn "point"
			var point = point.instantiate()
			point.global_position = pos
			add_child(point)
			pointRef = point
