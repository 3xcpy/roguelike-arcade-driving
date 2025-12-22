extends Node2D

@export var eyeball: PackedScene
@export var distance_from_center: float = 24.0
@export var rotation_speed: float = 30.0

@export var amount: int = 1
var eyeballs: Array[Area2D]
var rot := 0.0


func _ready() -> void:
	set_amount(amount)


func _physics_process(delta: float) -> void:
	rot += rotation_speed * delta
	var curr_rot = rot
	for e in eyeballs:
		e.global_position = Vector2(distance_from_center, 0.0).rotated(deg_to_rad(curr_rot)) + global_position
		curr_rot += 360.0/eyeballs.size()


func set_amount(val: int) -> void:
	for eye in eyeballs:
		eye.queue_free()
	eyeballs.clear()
	
	for i in val:
		var e: Area2D = eyeball.instantiate()
		e.top_level = true
		eyeballs.append(e)
		add_child(e)
		e.connect("body_entered", _on_eyeball_body_entered)
		e.connect("area_entered", _on_eyeball_area_entered)


func _on_eyeball_body_entered(body: Node2D) -> void:
	print(body)


func _on_eyeball_area_entered(area: Area2D) -> void:
	print(area)