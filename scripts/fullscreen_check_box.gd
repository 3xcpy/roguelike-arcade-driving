class_name FullscreenCheckBox extends CheckBox


func _ready() -> void:
	button_pressed = DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN
	toggled.connect(_on_toggled)


func _on_toggled(toggled_on: bool) -> void:
	if toggled_on:
		Global.saved_window_mode = DisplayServer.window_get_mode()
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(Global.saved_window_mode)