extends Node2D

@export var ScoreLabel : Label
@export var HighScoreLabel: Label

@export_category("Scenes")
@export_file(".tscn") var game_scene
@export_file(".tscn") var title_scene

func _on_try_again_pressed() -> void:
	get_tree().change_scene_to_file(game_scene)
	


func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file(title_scene)
