extends Node2D

func SetLine(pos1, pos2):
	print("set line: ", pos1, " - ", pos2)
	# self.scale = Vector2(pos1.x - pos2.x, 5)
	look_at(pos2)
