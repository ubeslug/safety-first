extends Control

@export_file(".tscn") var title_scene

@export var menu_container: VBoxContainer

func resume() -> void:
	get_tree().paused = false
	menu_container.visible = false

func pause() -> void:
	get_tree().paused = true
	menu_container.visible = true

func _unhandled_key_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause"):
		if get_tree().paused == false:
			pause()
		else:
			resume()

func _on_resume_button_pressed() -> void:
	resume()


func _on_restart_button_pressed() -> void:
	resume()
	get_tree().reload_current_scene()


func _on_main_menu_button_pressed() -> void:
	resume()
	get_tree().change_scene_to_file(title_scene)
