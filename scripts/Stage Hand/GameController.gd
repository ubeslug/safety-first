extends Node

@onready var timeText: Label = $CanvasLayer/TimeLeft
var timeLeft = 60

func _process(delta: float) -> void:
	TimeDecrease(delta)

func TimeDecrease(delta: float) -> void:
	timeLeft -= delta;
	timeText.text = str(int(timeLeft))
	if(timeLeft <= 0):
		pass
