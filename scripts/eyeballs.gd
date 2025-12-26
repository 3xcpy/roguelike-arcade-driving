@tool
class_name Eyeballs extends Node2D

@export var eyeball: PackedScene:
	set(e):
		eyeball = e
		if Engine.is_editor_hint():
			set_amount()
@export var damage: float = 1.0
var tick: float = 0.1
@export var distance_from_center: float = 24.0:
	set(d):
		distance_from_center = d
		if Engine.is_editor_hint():
			set_amount()
@export var rotation_speed: float = 30.0

@export var amount: int = 1:
	set(a):
		amount = a
		if Engine.is_editor_hint():
			set_amount()
var eyeballs: Array[Area2D]
var rot := 0.0
var timer: float = 0.0


func _ready() -> void:
	set_amount()


func _physics_process(delta: float) -> void:
	timer += delta
	if timer >= tick:
		timer = 0.0
		for eye in eyeballs:
			var overlapping_areas := eye.get_overlapping_areas()
			for a in overlapping_areas:
				if a.is_in_group("Enemies"):
					if a.has_method("damage"):
						a.damage(damage)

	rot += rotation_speed * delta
	var curr_rot = rot
	for e in eyeballs:
		e.global_position = Vector2(distance_from_center, 0.0).rotated(deg_to_rad(curr_rot)) + global_position
		curr_rot += 360.0/eyeballs.size()


func set_amount() -> void:
	for eye in eyeballs:
		eye.queue_free()
	eyeballs.clear()
	
	for i in amount:
		var e: Area2D = eyeball.instantiate()
		e.top_level = true
		eyeballs.append(e)
		add_child(e)