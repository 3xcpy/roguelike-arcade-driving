extends Node2D

var damage: float = 1.0
var tick: float = 0.1
@export var radius: float = 16.0

var timer: float = 0.0

@onready var area: Area2D = $Area2D


func _ready() -> void:
	set_radius(radius)


func _physics_process(delta: float) -> void:
	timer += delta
	if timer >= tick:
		timer = 0.0
		var overlapping_areas := area.get_overlapping_areas()
		for a in overlapping_areas:
			if a.is_in_group("Enemies"):
				if a.has_method("damage"):
					a.damage(damage)

	area.global_position = global_position # get_overlapping_bodies is only updated after physics_process, so this is staggered over the frames (i think)
	

func set_radius(rad: float) -> void:
	$Area2D/CollisionShape2D.shape.radius = rad
	$Area2D/Sprite2D.scale = Vector2(rad*2.0/128.0, rad*2.0/128.0);