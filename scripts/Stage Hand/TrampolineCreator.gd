extends Node2D

@export var trampoline: Resource

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
		print("L Click")
		if(pos1):
			var tramp = trampoline.instantiate()
			tramp.global_position = Vector2((pos1.x + pos.x) / 2, (pos1.y + pos.y) / 2)
			tramp.SetLine(pos1, pos)
			add_child(tramp)
			pos1 = null
			trampCount += 1
		else:
			pos1 = pos
