class_name DamageArea extends Area2D

@export var lifetime: float = 2.0
@export var radius: float = 16.0
@export var damage: float = 1.0

var tick: float = 0.1

var timer: float = 0.0


func _ready() -> void:
	_update_values()


func _physics_process(delta: float) -> void:
	timer += delta
	if timer >= tick:
		timer = 0.0
		var overlapping_areas = get_overlapping_areas()
		for a in overlapping_areas:
			if a.is_in_group("Enemies"):
				if a.has_method("damage"):
					a.damage(damage)

	lifetime -= delta
	if lifetime <= 0:
		queue_free()


func _update_values() -> void:
	$CollisionShape2D.shape.radius = radius
	$Sprite2D.scale = Vector2(radius * 2.0 / 128.0, radius * 2.0 / 128.0)