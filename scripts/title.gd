extends Node2D

@export_file(".tscn") var game_scene

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file(game_scene)


func _on_quit_pressed() -> void:
	get_tree().quit()
