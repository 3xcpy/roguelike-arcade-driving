class_name PauseMenu extends Control

signal quit_to_menu

var paused := false

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		paused = !paused
		update_state()


func update_state() -> void:
	if !Global.selecting_upgrades:
		get_tree().paused = paused
		visible = paused
	else:
		visible = paused


func _on_quit_to_menu_button_button_up() -> void:
	paused = false
	Global.selecting_upgrades = false
	update_state()
	quit_to_menu.emit()


func _on_resume_button_button_up() -> void:
	paused = false
	update_state()