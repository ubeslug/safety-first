extends Node2D

@onready var point1 = $"point 1"
@onready var point2 = $"point 2"

func SetLine(pos1, pos2):
	print("set line: ", pos1, " - ", pos2)
	# set point1 to pos1
	point1 = pos1
	
	# set point2 to pos2
	point2 = pos2
	print("point2: " , point2)
	# self.scale = Vector2(pos1.x - pos2.x, 5)
