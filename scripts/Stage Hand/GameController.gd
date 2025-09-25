extends Node

@onready var timeText: Label = $CanvasLayer/TimeLeft
var timeLeft = 5

@export_file() var game_over_scene

func _process(delta: float) -> void:
	TimeDecrease(delta)

func TimeDecrease(delta: float) -> void:
	timeLeft -= delta;
	timeText.text = str(int(timeLeft))
	if(timeLeft <= 0):
		#get_tree().unload_current_scene()
		get_tree().change_scene_to_file(game_over_scene)
