extends Node2D

var damage: float = 1.0
@export var radius: float = 16.0

@onready var area: Area2D = $Area2D


func _ready() -> void:
	set_radius(radius)


func _physics_process(_delta: float) -> void:
	area.global_position = global_position
	

func _on_area_2d_area_entered(in_area: Area2D) -> void:
	if in_area.has_method("damage"):
		in_area.damage(damage)


func set_radius(rad: float) -> void:
	$Area2D/CollisionShape2D.shape.radius = rad
	$Area2D/Sprite2D.scale = Vector2(rad*2.0/128.0, rad*2.0/128.0);