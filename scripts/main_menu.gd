class_name MainMenu extends Control

signal start_game


func _on_quit_button_button_up() -> void:
	get_tree().quit()

func _on_play_button_button_up() -> void:
	start_game.emit()