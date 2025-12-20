class_name Floor extends TextureRect

var positions := {}
var weights := {}
var current_index = 0.0


func get_valid_index() -> int:
	current_index += 1
	if current_index < 64:
		return current_index - 1
	else:
		return -1


func set_weight_and_position(index: int, w: float, p: Vector2) -> void:
	weights[index] = w
	positions[index] = p


func upload_data() -> void:
	var w = PackedFloat32Array()
	var p = PackedVector2Array()
	var wc = weights.size()

	for pi in positions:
		p.append(positions[pi])
	for wi in weights:
		w.append(weights[wi])
	

	material.set_shader_parameter("weight_positions", p)
	material.set_shader_parameter("weights", w)
	material.set_shader_parameter("weight_count", wc)


func _init() -> void:
	Global.floor = self


func _physics_process(_delta: float) -> void:
	upload_data()