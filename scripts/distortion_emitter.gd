class_name DistortionEmitter extends Node2D


func _physics_process(_delta: float) -> void:
	var screen_pos := get_global_transform_with_canvas().get_origin()
	var screen_size = DisplayServer.window_get_size()
	var screen_rect := Rect2(Vector2(0.0, 0.0), screen_size)
	if screen_rect.has_point(screen_pos):
		Global.floor.add_position(screen_pos)
		print(screen_pos)