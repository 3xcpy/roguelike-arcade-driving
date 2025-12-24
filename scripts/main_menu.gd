class_name MainMenu extends Control

signal start_game


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		start_game.emit()


func _on_quit_button_button_up() -> void:
	get_tree().quit()

func _on_play_button_button_up() -> void:
	start_game.emit()