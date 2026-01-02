class_name Laser extends Area2D

@export var damage: float = 1.0

var timer: float = 0.0
var tick: float = 0.1

@onready var line_2d := $Line2D
@onready var collision_shape_2d := $CollisionShape2D


func init(target: Vector2) -> void:
	line_2d.points[1] = to_local(target)
	var shape: SegmentShape2D = SegmentShape2D.new()
	shape.a = Vector2.ZERO
	shape.b = to_local(target)
	collision_shape_2d.shape = shape


func _physics_process(delta: float) -> void:
	timer += delta
	if timer >= tick:
		timer = 0.0
		var overlapping_areas = get_overlapping_areas()
		for a in overlapping_areas:
			if a.is_in_group("Enemies") and a.has_method("damage"):
				a.damage(damage)


func _on_timer_timeout() -> void:
	queue_free()