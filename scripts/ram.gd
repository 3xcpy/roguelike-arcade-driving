@tool
class_name Rame extends Area2D

@export var radius: float = 8.0:
	set(new_radius):
		radius = new_radius
		if Engine.is_editor_hint():
			update_values()

@export var damage: float = 1.0
var tick: float = 0.1
var timer: float = 0.0


func _ready() -> void:
	update_values()


func _physics_process(delta: float) -> void:
	timer += delta
	if timer >= tick:
		timer = 0.0
		var overlapping_areas := get_overlapping_areas()
		for a in overlapping_areas:
			if a.is_in_group("Enemies"):
				if a.has_method("damage"):
					a.damage(damage)


func update_values() -> void:
	$Sprite2D.scale = Vector2(radius*2.0 / 128, radius * 2.0 / 128)
	$CollisionShape2D.shape.size = Vector2(radius, radius * 2.0)
	$CollisionShape2D.position.x = radius/2.0
