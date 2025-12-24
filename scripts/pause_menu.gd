class_name PauseMenu extends Control

var paused := false

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		paused = !paused
		get_tree().paused = paused
		visible = paused