class_name MainMenu extends Control

signal start_game


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		start_game.emit()