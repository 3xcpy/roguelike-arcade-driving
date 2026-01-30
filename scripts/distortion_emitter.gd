class_name DistortionEmitter extends Node2D


func _physics_process(_delta: float) -> void:
	var screen_pos := get_global_transform_with_canvas().get_origin()
	var screen_size = Vector2(ProjectSettings.get_setting("display/window/size/viewport_width"), ProjectSettings.get_setting("display/window/size/viewport_height"))
	var screen_rect := Rect2(Vector2(-64.0, -64.0), screen_size + Vector2(64.0, 64.0))
	if screen_rect.has_point(screen_pos):
		Global.ground.add_position(screen_pos)