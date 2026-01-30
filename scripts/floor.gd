class_name Floor extends TextureRect

@export var weight: float = 0.2

var positions := []
var current_index = 0.0


func add_position(pos: Vector2) -> void:
	if positions.size() < 64:
		positions.append(pos)


func upload_data() -> void:
	var p = PackedVector2Array()

	for pos in positions:
		p.append(pos)

	material.set_shader_parameter("positions", p)
	material.set_shader_parameter("count", positions.size())
	material.set_shader_parameter("weight", weight)
	positions.clear()


func _init() -> void:
	Global.ground = self


func _physics_process(_delta: float) -> void:
	upload_data()